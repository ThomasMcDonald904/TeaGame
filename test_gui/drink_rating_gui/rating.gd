extends Panel



func _on_button_button_up():
	var served_drink: DrinkProperties = %ServedDrink.get_drink_preferences()
	var guest_preferences: GuestPreferences = %TargetDrink.get_guest_preferences()
	var rating = DrinkRating.get_rating(guest_preferences, served_drink, true)
	$VBox/HBoxContainer/RatingValue.text = str(snapped(rating[0], 0.01))
	$VBox/TemperatureRating/Value.text = str(snapped(rating[1], 0.01))
	$VBox/Astringency/Value.text = str(snapped(rating[2], 0.01))
	$VBox/SweetnessRating/Value.text = str(snapped(rating[3], 0.01))
	$VBox/FloralityRating/Value.text = str(snapped(rating[4], 0.01))
	$VBox/SpicednessRating/Value.text = str(snapped(rating[5], 0.01))
	$VBox/NuttynessRating/Value.text = str(snapped(rating[6], 0.01))
