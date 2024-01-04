extends Sprite2D

signal window_clicked(days_left: int)

func _on_area_2d_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed("click"):
		# Transfers preparation days to prep nights 
		window_clicked.emit(Globals.preparation_days - 1 - (Globals.current_day % (Globals.preparation_days + 1)))
