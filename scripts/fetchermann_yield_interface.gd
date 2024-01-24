extends Control

signal interface_dismissed

func _ready():
	set_size(get_viewport_rect().size)

func set_interface_text(_yield: Array[Ingredient], cost: int, change_left: int):
	var text = ""
	var added_ingredients: Array[Ingredient] = []
	for ingredient in _yield:
		if ingredient not in added_ingredients:
			text += " - " + ingredient.name + " x " + str(_yield.count(ingredient)) + "\n"
			added_ingredients.append(ingredient)
	$VBoxContainer/Yield.text = text
	$VBoxContainer/Cost.text = "Total spending: " + str(cost) + "$"
	$VBoxContainer/Change.text = "Leftover change: " + str(change_left) + "$"


func _on_gui_input(event: InputEvent):
	if event.is_action_released("click"):
		var tween = get_tree().create_tween()
		set_mouse_filter(Control.MOUSE_FILTER_IGNORE)
		interface_dismissed.emit()
		tween.tween_property(self, "position:x", -1350, 2)
		tween.tween_callback(queue_free)
