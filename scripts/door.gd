extends Sprite2D

func _on_area_2d_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed("click"):
		GameState.brewdio_door_clicked = true
