class_name GuestPreferencesDebugPanel
extends Panel

signal preferences_changed(guest_preferences : GuestPreferences)

var drink_pref_debug_PS = preload("res://test_gui/drink_preference_debug.tscn")

var guest_preferences : GuestPreferences

func _ready():
	guest_preferences = GuestPreferences.new()
	var v_box = $VBox
	
	var temp_debug: DrinkPreferenceDebug = drink_pref_debug_PS.instantiate()
	temp_debug.set_drink_preference(guest_preferences.temperature_preference)
	v_box.add_child(temp_debug)	
	temp_debug.connect("changed",update_guest_preferences)
	
	var astri_debug: DrinkPreferenceDebug = drink_pref_debug_PS.instantiate()
	astri_debug.set_drink_preference(guest_preferences.astringency_preference)
	v_box.add_child(astri_debug)	
	astri_debug.connect("changed",update_guest_preferences)
	
	var sweet_debug: DrinkPreferenceDebug = drink_pref_debug_PS.instantiate()
	sweet_debug.set_drink_preference(guest_preferences.sweetness_preference)
	v_box.add_child(sweet_debug)	
	sweet_debug.connect("changed",update_guest_preferences)
	
	var flor_debug: DrinkPreferenceDebug = drink_pref_debug_PS.instantiate()
	flor_debug.set_drink_preference(guest_preferences.florality_preference)
	v_box.add_child(flor_debug)	
	flor_debug.connect("changed",update_guest_preferences)
	
	var spice_debug: DrinkPreferenceDebug = drink_pref_debug_PS.instantiate()
	spice_debug.set_drink_preference(guest_preferences.spice_preference)
	v_box.add_child(spice_debug)	
	spice_debug.connect("changed",update_guest_preferences)
	
	var nut_debug: DrinkPreferenceDebug = drink_pref_debug_PS.instantiate()
	nut_debug.set_drink_preference(guest_preferences.nuttiness_preference)
	v_box.add_child(nut_debug)	
	nut_debug.connect("changed",update_guest_preferences)

func update_guest_preferences():
	Globals.current_guest_preferences.preference = guest_preferences
	preferences_changed.emit(guest_preferences)
	
func get_guest_preferences():
	return guest_preferences
