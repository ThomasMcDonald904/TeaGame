extends Node2D

var served_brew: Brew

var show_guests: bool = false
var fill_cups: bool = false

var reaction_screen_PS = preload("res://scenes/reaction_screen.tscn")
var reaction_screen: ReactionScreen = null

func _ready():
	#guests have not yet arived
	if Globals.days_to_prepare*Globals.current_day%(Globals.days_to_prepare+1) != 0:
		$Control/RoomClosed/VBoxContainer/HBoxContainer/nbr_days.text = str(Globals.days_to_prepare*Globals.current_day%(Globals.days_to_prepare+1))
		$Control/RoomClosed.visible = true
		$Control/RoomClosed/VBoxContainer/Label.visible = true
		$Control/RoomClosed/VBoxContainer/HBoxContainer.visible = true
		$TeaTable.visible = false
		await get_tree().create_timer(3).timeout.connect(func(): GameState.tea_session_done = true)
	#guests are here
	elif GameState.guests_already_served:
		$Control/RoomClosed.visible = true
		$TeaTable.visible = false
		$Control/RoomClosed/VBoxContainer/Label.visible = false
		$Control/RoomClosed/VBoxContainer/HBoxContainer.visible = false
		$Control/RoomClosed/VBoxContainer/GuestsAlreadyServed.visible = true
		$TeaTable.visible = false
		$BrewingStation.visible = false
		await get_tree().create_timer(3).timeout.connect(func(): GameState.tea_session_done = true)
	else:
		$TeaTable.visible = true
		$Control/RoomClosed.visible = false
		$BrewingStation.visible = true
		show_guests = true


func _on_brewing_station_serve_brew(brew: Brew):
	fill_cups = true
	served_brew = brew

func _on_tea_drunk():
	reaction_screen = reaction_screen_PS.instantiate()
	$Control.add_child(reaction_screen)
	reaction_screen.connect("closed_rating_scroll", _on_closed_rating_scroll)
	reaction_screen.present_rating(served_brew)

func _on_closed_rating_scroll():
	# Probably mucho stinky code
	# It gets the index of the steeper *by NAME* and proceeds to clear the 
	# corresponding steeper inventory
	Globals.inventories[Globals.inventories.map(func(x: ContainerInventory): return x.container_name).find("Steeper")].inventory = []
	GameState.tea_session_done = true
	GameState.guests_already_served = true
