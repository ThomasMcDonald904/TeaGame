extends AnimatedSprite2D

signal fetchermann_clicked


func _on_area_2d_input_event(viewport, event: InputEvent, shape_idx):
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

func extract_items_from_text(text: String):
	text = text.to_lower()
	var ingredients_dir: DirAccess = DirAccess.open("res://ingredients/")
	for item_name in ingredients_dir.get_files():
		var filename: String = ingredients_dir.get_current_dir() + "/" + item_name
		var item = load(filename) as Ingredient
		if item.name.to_lower() in text:
			Market.fetchermann_requested_items.append(item)
