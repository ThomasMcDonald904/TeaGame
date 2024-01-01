class_name Storyteller
extends RefCounted

func generate_story(guest_preferences: GuestPreferences) -> String:
	var intro : String = "Hello,\nWe are coming for tea in one week.\n"
	
	#_temperature, _astringency, _sweetness, _florality, _spicedness, _nuttyness
	var temperature : String = "We like our tea at a temperature of %d.1\n" % guest_preferences.temperature
	
	return intro+temperature
