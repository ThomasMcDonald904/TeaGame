extends Node2D

var brew: Brew

var show_guests: bool = false
var fill_cups: bool = false

func _ready():
	#guests have not yet arived
	if Globals.days_to_prepare*Globals.current_day%(Globals.days_to_prepare+1) != 0:
		$Control/RoomClosed/VBoxContainer/HBoxContainer/nbr_days.text = str(Globals.days_to_prepare*Globals.current_day%(Globals.days_to_prepare+1))
		$Control/RoomClosed.visible = true
		$TeaTable.visible = false
		await get_tree().create_timer(3).timeout.connect(func(): GameState.tea_session_done = true)
	#guests are here
	else:
		$Control/RoomClosed.visible = false
		$TeaTable.visible = true
		$BrewingStation.visible = true
		show_guests = true


func _on_brewing_station_serve_brew():
	fill_cups = true

func _on_tea_drunk():
	GameState.tea_session_done = true
