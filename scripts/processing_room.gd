extends Node2D

@onready var processes: Array[Node2D] = [$Steaming, $Roasting, $Oxidizing]
var current_process: int = 1


func _on_previous_process_button_up():
		%Label.text = processes[current_process-1].name
		var leaving_tweener = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
		var arriving_tweener = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
		leaving_tweener.tween_property(processes[current_process], "position", Vector2(2200, 300), 1)
		arriving_tweener.tween_property(processes[current_process - 1], "position", Vector2(960,300), 1)
		current_process -= 1
		%NextProcess.disabled = false
		if current_process == 0:
			%PreviousProcess.disabled = true


func _on_next_process_button_up():
		%Label.text = processes[current_process-1].name
		var leaving_tweener = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
		var arriving_tweener = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
		leaving_tweener.tween_property(processes[current_process], "position", Vector2(-280, 300), 1)
		arriving_tweener.tween_property(processes[current_process + 1], "position", Vector2(960,300), 1)
		current_process += 1
		%PreviousProcess.disabled = false
		if current_process == len(processes) - 1:
			%NextProcess.disabled = true

