class_name ReactionScreen
extends Control

# Rating 1 to 0.75
@export var good_threshold = 0.75
# Rating 0.01 to 0.2
@export var almost_bad_threshold = 0.2
# 0 is bad

signal closed_rating_scroll

var good_temperature: String = "We quite like the temperature. "
var almost_bad_temperature: String = "The temperature is barely bareable. "
var bad_temperature: String = "We dislike the temperature. "

var good_astringency: String = "We quite like the bitterness. "
var almost_bad_astringency: String = "The bitterness is barely bareable. "
var bad_astringency: String = "We dislike the bitterness. "

var good_sweetness: String = "We quite like the sweetness. "
var almost_bad_sweetness: String = "The sweetness is barely bareable. "
var bad_sweetness: String = "We dislike the sweetness. "

var good_florality: String = "We quite like the florality. "
var almost_bad_florality: String = "The florality is barely bareable. "
var bad_florality: String = "We dislike the florality. "

var good_spicedness: String = "We quite like the spices. "
var almost_bad_spicedness: String = "The amount of spices is barely bareable. "
var bad_spicedness: String = "We dislike the quantity of spices. "

var good_nuttyness: String = "We quite like the nuttyness. "
var almost_bad_nuttyness: String = "The nuttyness is barely bareable. "
var bad_nuttyness: String = "We dislike the nuttyness. "

func _input(event: InputEvent):
	if event.is_action_pressed("click"):
		queue_free()
		emit_signal("closed_rating_scroll")

func present_rating(brew: Brew):
	var message: String = ""
	var guest_preference: GuestPreferences = Globals.current_guest_preferences.preference
	var reaction = DrinkRating.get_rating(guest_preference, brew.drink_property, true)

	for index in reaction.slice(1).size():
		match index:
			0:
				if guest_preference.temperature_preference.ignored:
					continue
				if reaction.slice(1)[index] >= good_threshold:
					message += good_temperature
				elif reaction.slice(1)[index] > 0 and reaction.slice(1)[index] <= almost_bad_threshold:
					message += almost_bad_temperature
				elif reaction.slice(1)[index] == 0:
					message += bad_temperature
			1:
				if guest_preference.astringency_preference.ignored:
					continue
				if reaction.slice(1)[index] >= good_threshold:
					message += good_astringency
				elif reaction.slice(1)[index] > 0 and reaction.slice(1)[index] <= almost_bad_threshold:
					message += almost_bad_astringency
				elif reaction.slice(1)[index] == 0:
					message += bad_astringency
			2:
				if guest_preference.sweetness_preference.ignored:
					continue
				if reaction.slice(1)[index] >= good_threshold:
					message += good_sweetness
				elif reaction.slice(1)[index] > 0 and reaction.slice(1)[index] <= almost_bad_threshold:
					message += almost_bad_sweetness
				elif reaction.slice(1)[index] == 0:
					message += bad_sweetness
			3:
				if guest_preference.florality_preference.ignored:
					continue
				if reaction.slice(1)[index] >= good_threshold:
					message += good_florality
				elif reaction.slice(1)[index] > 0 and reaction.slice(1)[index] <= almost_bad_threshold:
					message += almost_bad_florality
				elif reaction.slice(1)[index] == 0:
					message += bad_florality
			4:
				if guest_preference.spicedness_preference.ignored:
					continue
				if reaction.slice(1)[index] >= good_threshold:
					message += good_spicedness
				elif reaction.slice(1)[index] > 0 and reaction.slice(1)[index] <= almost_bad_threshold:
					message += almost_bad_spicedness
				elif reaction.slice(1)[index] == 0:
					message += bad_spicedness
			5:
				if guest_preference.nuttyness_preference.ignored:
					continue
				if reaction.slice(1)[index] >= good_threshold:
					message += good_nuttyness
				elif reaction.slice(1)[index] > 0 and reaction.slice(1)[index] <= almost_bad_threshold:
					message += almost_bad_nuttyness
				elif reaction.slice(1)[index] == 0:
					message += bad_nuttyness
	$VBoxContainer/Label.text = message
	var _animation: Animation = $AnimationPlayer.get_animation("set_rating")
	$HBoxContainer/numerical_value.text = "%2.2f"%reaction[0]
	_animation.track_set_key_value(_animation.find_track("HBoxContainer/TextureProgressBar:value", 0), 1, float(reaction[0]))
	$AnimationPlayer.play("set_rating")
