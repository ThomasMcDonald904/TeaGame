extends Sprite2D

signal read_letter

func _on_area_2d_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed("click"):
		read_letter.emit()
