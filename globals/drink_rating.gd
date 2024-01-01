func get_rating(guest_preferences: GuestPreferences, served_drink: DrinkProperties):
	var score = 0
	# TODO finish rating for all properties
	score += get_property_rating(served_drink.get("temperature"), guest_preferences.get("astringency"), )

func get_property_rating(served, target, threshold_lower_bound, threshold_upper_bound):
	if served < target:
		return inverse_lerp(threshold_lower_bound, target, served)
	elif served > target:
		return inverse_lerp(target, threshold_upper_bound, served)
	else:
		return 1
