extends AnimatedSprite2D

signal fetchermann_clicked
signal fetchermann_arrived(collected_items: Array[Ingredient], total_cost: int)

@onready var original_x = position.x

var collected_items: Array[Ingredient] = []

func _on_area_2d_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed("click"):
		emit_signal("fetchermann_clicked")


func leave(desired_items_text: String, budget: int):
	Market.fetchermann_budget = budget
	Market.fetchermann_day_sent = Globals.current_day
	extract_items_from_text(desired_items_text)
	play("leaving")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(2000, position.y), 2).set_trans(Tween.TRANS_BACK)
	tween.tween_callback(queue_free)

func arrive():
	var initial_budget = Market.fetchermann_budget
	collected_items = get_items_collected_at_market()
	position.x = 2000
	play("arriving")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(original_x, position.y), 2).set_trans(Tween.TRANS_QUART)
	tween.tween_callback(emit_signal.bind("fetchermann_arrived", collected_items, initial_budget - Market.fetchermann_budget))
	tween.tween_callback(play.bind("idle"))

func get_items_collected_at_market() -> Array[Ingredient]:
	var bought_items: Array[Ingredient] = []
	var market_stock: Array[Ingredient] = Market.get_specific_day_stock(Market.fetchermann_day_sent)
	Market.fetchermann_requested_items.sort_custom(func(a: Ingredient, b: Ingredient): return a.sell_price > b.sell_price)
	for item in Market.fetchermann_requested_items:
		while item in market_stock:
			if not Market.fetchermann_budget - item.sell_price < 0:
				Market.fetchermann_budget -= item.sell_price 
				bought_items.append(item)
				market_stock.erase(item)
				print(item.name)
			else:
				break
	return bought_items

func extract_items_from_text(text: String):
	text = text.to_lower()
	var ingredients_dir: DirAccess = DirAccess.open("res://ingredients/")
	for item_name in ingredients_dir.get_files():
		var filename: String = ingredients_dir.get_current_dir() + "/" + item_name
		var item = load(filename) as Ingredient
		if item.name.to_lower() in text:
			Market.fetchermann_requested_items.append(item)
