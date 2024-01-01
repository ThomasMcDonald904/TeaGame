class_name Storyteller
extends RefCounted

func generate_story(guest_preferences: GuestPreferences) -> String:
	var intro : String = "Hello,\nI am coming for tea in one week.\n"
	
	#_temperature, _astringency, _sweetness, _florality, _spicedness, _nuttyness
	var temperature : String = "I like my tea at a temperature of %3.1f\n" % guest_preferences.temperature_preference.value
	var astringency : String = "Personally, I prefer tea with %3.1f astringency\n" % guest_preferences.astringency_preference.value
	var sweetness : String = "A sweetness of %3.1f has always tickled my fancy.\n" % guest_preferences.sweetness_preference.value
	
	return intro+temperature+astringency+sweetness
