extends Node2D

func _ready():
	$Letter.connect("read_letter", give_letter)
	$AnimationPlayer.animation_finished.connect(func(_anim_name): GameState.letter_read = true)

func give_letter():
	if GameState.first_time_experience or Globals.preparation_days - (Globals.current_day % (Globals.preparation_days + 1)) == 0:
		var storyteller: Storyteller = Storyteller.new()
		var guest_profile: GuestProfile = GuestProfile.new()
		storyteller.generate_story(guest_profile)
		Globals.current_guest_preferences = guest_profile
		$Control/ColorRect/RichTextLabel.text = guest_profile.story
		$AnimationPlayer.play("ReadLetter")
	else:
		$Control/ColorRect/RichTextLabel.text = Globals.current_guest_preferences.story
		$AnimationPlayer.play("ReadLetter")
