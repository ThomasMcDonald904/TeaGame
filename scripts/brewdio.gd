class_name Brewdio extends Node2D

signal goto_tea_room()
signal goto_office()

var fetchermann_interface_PS: PackedScene = preload("res://scenes/GUI/fetchermann_interface.tscn")

@export var steeper: OpenContainer

func _ready():
	$Window.window_clicked.connect(next_day)
	$Fetchermann.fetchermann_clicked.connect(show_fetchermann_journal)

func _exit_tree():
	pass
	#Globals.can_open_container = true

func next_day(nbr_days):
	$Control/VBoxContainer/GuestsArrivingTomorrow.visible = true if nbr_days == 1 else false
	$Control/VBoxContainer/Title.visible = false if nbr_days == 1 or nbr_days == 0 else true
	$Control/VBoxContainer/nbr_days.visible = false if nbr_days == 1 or nbr_days == 0 else true
	$Control/VBoxContainer/GuestsAreHere.visible = true if nbr_days == 0 else false
	$Control/AnimationPlayer.play("fade_to_night")
	$Control/VBoxContainer/nbr_days.text = "[center]" + str(nbr_days)

func increment_current_day():
	Globals.current_day += 1
	# Anything that must called when there is a new day
	GameState.letter_read = false
	GameState.guests_already_served = false

func set_nbr_days_text():
	$Control/VBoxContainer/nbr_days.text = "[wave amp=50][center]" + str(Globals.days_to_prepare*Globals.current_day%(Globals.days_to_prepare+1))

func populate_global_steeper_ingredients():
	Globals.steeper_ingredients.clear()
	for item in steeper.inventory:
		if (item as Item).ingredient != null:
			Globals.steeper_ingredients.append((item as Item).ingredient)
	Globals.steeper_ingredients_changed.emit()

func _on_service_tassle_tassle_pulled():
	goto_tea_room.emit()

func show_fetchermann_journal():
	var inst = fetchermann_interface_PS.instantiate()
	add_child(inst)
	inst.close_journal.connect($Fetchermann.leave)
