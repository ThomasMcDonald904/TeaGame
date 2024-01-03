extends Sprite2D

@export var letter_read: bool = false

func _on_area_2d_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed("click") and letter_read:
		GameState.emit_signal("enter_brewdio")
