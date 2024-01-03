extends Node2D

func _ready():
	$Letter.connect("read_letter", give_letter)

func give_letter():
	var storyteller: Storyteller = Storyteller.new()
	var guest_profile: GuestProfile = GuestProfile.new()
	storyteller.generate_story(guest_profile)
	Globals.current_guest_preferences = guest_profile
	$Control/ColorRect/RichTextLabel.text = guest_profile.story
	$AnimationPlayer.play("ReadLetter")
