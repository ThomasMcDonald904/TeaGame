extends Control

signal close_journal(desired_items_text: String, budget: int)

@export var number_of_predictions: int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	set_size(get_viewport_rect().size)
	
	$HBoxContainer/Money.text = str(Globals.money) + "$"
	
	var market_stock: Array[Ingredient] = Market.get_current_market_stock()
	var predictions: Array[Ingredient] = get_market_predictions(market_stock)
	var always_available_ingredients: Array[Ingredient] = get_always_available_ingredients(market_stock)
	
	if not predictions.is_empty():
		var text = ""
		for prediction in predictions:
			text += " - " + prediction.name + "\n"
		$VBoxContainer2/MarketPredictions.text = text
	else:
		$VBoxContainer2/MarketPredictions.text = "The fetchermann doesn't have any predictions for today"

	for ingredient in always_available_ingredients:
		var label = Label.new()
		label.text = " - " + ingredient.name
		$VBoxContainer2/PanelContainer/VBoxContainer/GridContainer.add_child(label)


func _on_close_journal_button_up():
	queue_free()

func get_always_available_ingredients(market_stock: Array[Ingredient]):
	var always_available_ingredients: Array[Ingredient] = market_stock.filter(func(ingredient: Ingredient): return ingredient.rarity == 100)
	# Remove duplicates
	var final_list: Array[Ingredient] = []
	for ingredient in always_available_ingredients:
		if ingredient not in final_list:
			final_list.append(ingredient)
	return final_list

func get_market_predictions(market_stock: Array[Ingredient]):
	if Market.fetchermann_daily_market_predictions.has(str(Globals.current_day)):
		return Market.fetchermann_daily_market_predictions[str(Globals.current_day)]
	var predictions: Array[Ingredient] = []
	market_stock = market_stock.filter(func(ingredient: Ingredient): return ingredient.rarity < 100)
	if market_stock.is_empty():
		return predictions
	for i in range(number_of_predictions):
		var pick = market_stock.pick_random()
		if pick not in predictions:
			predictions.append(pick)
	Market.fetchermann_daily_market_predictions[str(Globals.current_day)] = predictions
	return predictions


func _on_give_request_button_up():
	if int($VBoxContainer/HBoxContainer/LineEdit.text) > Globals.money or int($VBoxContainer/HBoxContainer/LineEdit.text) <= 0:
		var tween = get_tree().create_tween()
		$AlertFlag.visible = true
		for i in range(4):
			tween.tween_property($VBoxContainer/HBoxContainer/LineEdit, "position:x", $VBoxContainer/HBoxContainer/LineEdit.position.x + 3, 0.05)
			tween.tween_property($VBoxContainer/HBoxContainer/LineEdit, "position:x", $VBoxContainer/HBoxContainer/LineEdit.position.x - 3, 0.05)
		tween.tween_callback(func(): $AlertFlag.visible = false).set_delay(3)
		await tween.finished
		return
	close_journal.emit($VBoxContainer/TextEdit.text, int($VBoxContainer/HBoxContainer/LineEdit.text))
	queue_free()
