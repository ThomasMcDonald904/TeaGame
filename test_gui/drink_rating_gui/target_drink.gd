class_name GuestPreferencesDebugPanel
extends Panel

var temperature = 0
var astringency = 0
var sweetness = 0
var florality = 0
var spicedness = 0
var nuttyness = 0

var guest_preferences : GuestPreferences

@onready var temp_lower_bound:SpinBox = $VBox/TemperatureTitleContainer/LowerBound
@onready var temp_upper_bound:SpinBox = $VBox/TemperatureTitleContainer/UpperBound
@onready var astringency_lower_bound:SpinBox = $VBox/AstringencyTitleContainer/LowerBound
@onready var astringency_upper_bound:SpinBox = $VBox/AstringencyTitleContainer/UpperBound
@onready var sweetness_lower_bound:SpinBox = $VBox/SweetnessTitleContainer/LowerBound
@onready var sweetness_upper_bound:SpinBox = $VBox/SweetnessTitleContainer/UpperBound
@onready var florality_lower_bound:SpinBox = $VBox/FloralityTitleContainer/LowerBound
@onready var florality_upper_bound:SpinBox = $VBox/FloralityTitleContainer/UpperBound
@onready var spicedness_lower_bound:SpinBox = $VBox/SpicednessTitleContainer/LowerBound
@onready var spicedness_upper_bound:SpinBox = $VBox/SpicednessTitleContainer/UpperBound
@onready var nuttyness_lower_bound:SpinBox = $VBox/NuttynessTitleContainer/LowerBound
@onready var nuttyness_upper_bound:SpinBox = $VBox/NuttynessTitleContainer/UpperBound

func _ready():
	guest_preferences = GuestPreferences.new()

signal preferences_changed(guest_preferences : GuestPreferences)

func update_guest_preferences():
	guest_preferences.temperature = temperature
	guest_preferences.temperature_tolerance_lower_bound = temp_lower_bound.value
	guest_preferences.temperature_tolerance_upper_bound = temp_upper_bound.value
	
	guest_preferences.astringency = astringency
	guest_preferences.astringency_tolerance_lower_bound = astringency_lower_bound.value
	guest_preferences.astringency_tolerance_upper_bound = astringency_upper_bound.value
	
	guest_preferences.sweetness = sweetness
	guest_preferences.sweetness_tolerance_lower_bound = sweetness_lower_bound.value
	guest_preferences.sweetness_tolerance_upper_bound = sweetness_upper_bound.value
	
	guest_preferences.florality = florality
	guest_preferences.florality_tolerance_lower_bound = florality_lower_bound.value
	guest_preferences.florality_tolerance_upper_bound = florality_upper_bound.value
	
	guest_preferences.spicedness = spicedness
	guest_preferences.spicedness_tolerance_lower_bound = spicedness_lower_bound.value
	guest_preferences.spicedness_tolerance_upper_bound = spicedness_upper_bound.value
	
	guest_preferences.nuttyness = nuttyness
	guest_preferences.nuttyness_tolerance_lower_bound = nuttyness_lower_bound.value
	guest_preferences.nuttyness_tolerance_upper_bound = nuttyness_upper_bound.value
	preferences_changed.emit(guest_preferences)
	
func get_guest_preferences():
	return GuestPreferences.new(temperature, astringency, sweetness, florality, spicedness, nuttyness,
	temp_lower_bound.value, temp_upper_bound.value, astringency_lower_bound.value, astringency_upper_bound.value, 
	sweetness_lower_bound.value, sweetness_upper_bound.value, florality_lower_bound.value, florality_upper_bound.value,
	spicedness_lower_bound.value, spicedness_upper_bound.value, nuttyness_lower_bound.value, nuttyness_upper_bound.value)

func _on_temp_slider_value_changed(value):
	$VBox/TempSliderContainer/TempValue.text = "%04.1f"%value
	temperature = value
	if value < temp_lower_bound.value:
		temp_lower_bound.set_value_no_signal(value)
	if value > temp_upper_bound.value:
		temp_upper_bound.set_value_no_signal(value)

func _on_astringency_slider_value_changed(value):
	$VBox/AstringencySliderContainer/AstringencyValue.text = "%04.1f"%value
	astringency = value
	if value < astringency_lower_bound.value:
		astringency_lower_bound.set_value_no_signal(value)
	if value > astringency_upper_bound.value:
		astringency_upper_bound.set_value_no_signal(value)

func _on_sweetness_slider_value_changed(value):
	$VBox/SweetnessSliderContainer/SweetnessValue.text = "%04.1f"%value
	sweetness = value
	if value < sweetness_lower_bound.value:
		sweetness_lower_bound.set_value_no_signal(value)
	if value > sweetness_upper_bound.value:
		sweetness_upper_bound.set_value_no_signal(value)

func _on_florality_slider_value_changed(value):
	$VBox/FloralitySliderContainer/FloralityValue.text = "%04.1f"%value
	florality = value
	if value < florality_lower_bound.value:
		florality_lower_bound.set_value_no_signal(value)
	if value > astringency_upper_bound.value:
		florality_upper_bound.set_value_no_signal(value)

func _on_spicedness_slider_value_changed(value):
	$VBox/SpicednessSliderContainer/SpicednessValue.text = "%04.1f"%value
	spicedness = value
	if value < spicedness_lower_bound.value:
		spicedness_lower_bound.set_value_no_signal(value)
	if value > spicedness_upper_bound.value:
		spicedness_upper_bound.set_value_no_signal(value)

func _on_nuttyness_slider_value_changed(value):
	$VBox/NuttynessSliderContainer/NuttynessValue.text = "%04.1f"%value
	nuttyness = value
	if value < nuttyness_lower_bound.value:
		nuttyness_lower_bound.set_value_no_signal(value)
	if value > nuttyness_upper_bound.value:
		nuttyness_upper_bound.set_value_no_signal(value)
	
func _on_preference_slider_drag_ended(value_changed: bool):
	if !value_changed:
		return
	update_guest_preferences()
