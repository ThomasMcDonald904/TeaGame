extends Control

signal close_journal(desired_items_text: String, budget: int)

@export var number_of_predictions: int = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	set_size(get_viewport_rect().size)
	var market_stock: Array[Ingredient] = Market.get_current_market_stock()
	var predictions: Array[Ingredient] = get_market_predictions(market_stock)
	var always_available_ingredients: Array[Ingredient] = get_always_available_ingredients(market_stock)
	
	var text = ""
	for prediction in predictions:
		text += " - " + prediction.name + "\n"
	$VBoxContainer2/MarketPredictions.text = text
	
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
	for i in range(number_of_predictions):
		var pick = market_stock.pick_random()
		if pick not in predictions:
			predictions.append(pick)
	Market.fetchermann_daily_market_predictions[str(Globals.current_day)] = predictions
	return predictions


func _on_give_request_button_up():
	close_journal.emit($VBoxContainer/TextEdit.text, int($VBoxContainer/HBoxContainer/LineEdit.text))
	queue_free()
