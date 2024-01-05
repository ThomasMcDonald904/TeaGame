class_name Brewdio extends Node2D

signal goto_tea_room()
signal goto_office()

@export var steeper: OpenContainer

func _ready():
	$Window.window_clicked.connect(next_day)

func next_day(nbr_days):
	$Control/VBoxContainer/GuestsArrivingTomorrow.visible = true if nbr_days == 1 else false
	$Control/VBoxContainer/Title.visible = false if nbr_days == 1 or nbr_days == 0 else true
	$Control/VBoxContainer/nbr_nights.visible = false if nbr_days == 1 or nbr_days == 0 else true
	$Control/VBoxContainer/NewLetter.visible = true if nbr_days == 0 else false
	if nbr_days == -1:
		$Control/AnimationPlayer.play("fade_to_night_new_week")
	else:
		$Control/AnimationPlayer.play("fade_to_night")
	$Control/VBoxContainer/nbr_nights.text = "[center]" + str(nbr_days)

func increment_current_day():
	Globals.current_day += 1

func set_nbr_days_text():
	$Control/VBoxContainer/nbr_nights.text = "[wave amp=50][center]" + str(Globals.preparation_days - 1 - (Globals.current_day % (Globals.preparation_days + 1)))

func populate_global_steeper_ingredients():
	Globals.steeper_ingredients.clear()
	for item in steeper.inventory:
		if (item as Item).ingredient != null:
			Globals.steeper_ingredients.append((item as Item).ingredient)
	Globals.steeper_ingredients_changed.emit()

func _on_service_tassle_tassle_pulled():
	goto_tea_room.emit()
