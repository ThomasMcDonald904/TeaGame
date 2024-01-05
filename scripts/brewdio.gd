extends Node2D

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