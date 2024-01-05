extends Node

func get_rating(guest_preferences: GuestPreferences, served_drink: DrinkProperties, get_raw_ratings: bool = false):
	var score = 0
	var temperature = get_property_rating(served_drink.temperature.value, guest_preferences.temperature_preference)
	var astringency = get_property_rating(served_drink.astringency.value, guest_preferences.astringency_preference)
	var sweetness = get_property_rating(served_drink.sweetness.value, guest_preferences.sweetness_preference)
	var florality = get_property_rating(served_drink.florality.value, guest_preferences.florality_preference)
	var spicedness = get_property_rating(served_drink.spicedness.value, guest_preferences.spicedness_preference)
	var nuttyness = get_property_rating(served_drink.nuttyness.value, guest_preferences.nuttyness_preference)
	score += temperature
	score += astringency
	score += sweetness
	score += florality
	score += spicedness
	score += nuttyness
	if get_raw_ratings:
		return [score, temperature, astringency, sweetness, florality, spicedness, nuttyness]
	return score
	
func get_property_rating(served: float, preference: DrinkPropertyPreference):
	if served < preference.lower_bound:
		return 0
	elif served > preference.upper_bound:
		return 0
	elif served < preference.value:
		return inverse_lerp(preference.lower_bound, preference.value, served)
	elif served > preference.value:
		return inverse_lerp(preference.upper_bound, preference.value, served)
	else:
		return 1
