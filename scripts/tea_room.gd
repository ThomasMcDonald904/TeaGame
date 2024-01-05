extends Node2D

func _ready():
	#guests have not yet arived
	if Globals.preparation_days - (Globals.current_day % (Globals.preparation_days + 1)) != 0:
		$Control/RoomClosed/VBoxContainer/HBoxContainer/nbr_days.text = str(Globals.preparation_days - (Globals.current_day % (Globals.preparation_days + 1)))
		$Control/RoomClosed.visible = true
		await get_tree().create_timer(3).timeout.connect(func(): GameState.tea_session_done = true)
	#guests are here
	else:
		$Control/RoomClosed.visible = false
		$BrewingStation.visible = true
