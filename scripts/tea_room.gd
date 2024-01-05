extends Node2D

var brew: Brew

func _ready():
	if Globals.preparation_days - (Globals.current_day % (Globals.preparation_days + 1)) != 0:
		$Control/VBoxContainer/HBoxContainer/nbr_days.text = str(Globals.preparation_days - (Globals.current_day % (Globals.preparation_days + 1)))
		$Control.visible = true
		await get_tree().create_timer(3).timeout.connect(func(): GameState.tea_session_done = true)
