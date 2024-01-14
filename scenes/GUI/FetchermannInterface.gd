extends Control

signal close_journal(desired_items_text: String, budget: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_size(get_viewport_rect().size)

func _on_close_journal_button_up():
	close_journal.emit($VBoxContainer/TextEdit.text, int($VBoxContainer/HBoxContainer/LineEdit.text))
	queue_free()
