extends Sprite2D

signal window_clicked(days_left: int)

func _on_area_2d_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed("click"):
		window_clicked.emit(Globals.days_to_prepare*Globals.current_day%(Globals.days_to_prepare+1))
		
