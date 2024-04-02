extends Node2D

@onready var processes: Array[Node2D] = [$Steaming, $Roasting, $Oxidizing]
var resulting_ingredients: Array[Ingredient] = [preload("res://ingredients/ingredient_tea_leaves.tres"), preload("res://ingredients/ingredient_roasted_tea.tres"), preload("res://ingredients/ingredient_black_tea.tres")]
var current_process: int = 1

@export var time_for_processing: int = 3

func _ready():
	if Globals.amount_of_tea_being_processed != 0:
		if Globals.current_day - Globals.day_processing_started - 1 >= time_for_processing:
			$Control/SelectionMenu.visible = false
			$Control/ProcessingMenu.visible = true
			processes[resulting_ingredients.find(Globals.being_processed_into)].play("processed")
		else:
			$Control/SelectionMenu.visible = false
			$Control/ProcessingMenu.visible = true
			processes[resulting_ingredients.find(Globals.being_processed_into)].play("loaded")
	else:
			$Control/SelectionMenu.visible = true
			$Control/ProcessingMenu.visible = false

func _on_previous_process_button_up():
		var leaving_tweener = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
		var arriving_tweener = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
		leaving_tweener.tween_property(processes[current_process], "position", Vector2(2200, 300), 1)
		arriving_tweener.tween_property(processes[current_process - 1], "position", Vector2(960,300), 1)
		current_process -= 1
		%Label.text = processes[current_process].name
		%NextProcess.disabled = false
		if current_process == 0:
			%PreviousProcess.disabled = true


func _on_next_process_button_up():
		var leaving_tweener = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
		var arriving_tweener = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
		leaving_tweener.tween_property(processes[current_process], "position", Vector2(-280, 300), 1)
		arriving_tweener.tween_property(processes[current_process + 1], "position", Vector2(960,300), 1)
		current_process += 1
		%Label.text = processes[current_process].name
		%PreviousProcess.disabled = false
		if current_process == len(processes) - 1:
			%NextProcess.disabled = true



func _on_load_tea_button_up():
	Globals.amount_of_tea_being_processed = %LoadAmount.value
	Globals.being_processed_into = resulting_ingredients[current_process]
	processes[current_process].play("loaded")
	$Control/SelectionMenu.visible = false
	Globals.day_processing_started = Globals.current_day
