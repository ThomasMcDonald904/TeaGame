func get_rating(guest_preferences: GuestPreferences, served_drink: DrinkProperties):
	var score = 0
	score += get_property_rating(served_drink.get("temperature"), guest_preferences.get("temperature"), guest_preferences.get("temperature_tolerance_lower_bound"), guest_preferences.get("temperature_tolerance_upper_bound"))
	score += get_property_rating(served_drink.get("astringency"), guest_preferences.get("astringency"), guest_preferences.get("astringency_tolerance_lower_bound"), guest_preferences.get("astringency_tolerance_upper_bound"))
	score += get_property_rating(served_drink.get("sweetness"), guest_preferences.get("sweetness"), guest_preferences.get("sweetness_tolerance_lower_bound"), guest_preferences.get("sweetness_tolerance_upper_bound"))
	score += get_property_rating(served_drink.get("florality"), guest_preferences.get("florality"), guest_preferences.get("florality_tolerance_lower_bound"), guest_preferences.get("florality_tolerance_upper_bound"))
	score += get_property_rating(served_drink.get("spicedness"), guest_preferences.get("spicedness"), guest_preferences.get("spicedness_tolerance_lower_bound"), guest_preferences.get("spicedness_tolerance_upper_bound"))
	score += get_property_rating(served_drink.get("nuttyness"), guest_preferences.get("nuttyness"), guest_preferences.get("nuttyness_tolerance_lower_bound"), guest_preferences.get("nuttyness_tolerance_upper_bound"))
	return score
func get_property_rating(served, target, threshold_lower_bound, threshold_upper_bound):
	if served < target:
		return inverse_lerp(threshold_lower_bound, target, served)
	elif served > target:
		return inverse_lerp(target, threshold_upper_bound, served)
	else:
		return 1
