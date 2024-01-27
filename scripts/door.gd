extends Sprite2D

func _on_area_2d_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed("click"):
		if get_parent().name == "Office":
			GameState.office_door_clicked = true
		else:
			GameState.brewdio_door_clicked = true
	if event.is_action_released("click"):
		GameState.office_door_clicked = false
		GameState.brewdio_door_clicked = false
