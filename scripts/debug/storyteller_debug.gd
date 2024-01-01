extends Panel

@onready var rich_text_label: RichTextLabel = $RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_target_drink_preferences_changed(guest_preferences):
	var storyteller: Storyteller = Storyteller.new()
	var story: String = storyteller.generate_story(guest_preferences)
	rich_text_label.text = story
