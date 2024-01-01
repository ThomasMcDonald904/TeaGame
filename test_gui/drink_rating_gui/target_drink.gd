extends Panel

var temperature = 0
var astringency = 0
var sweetness = 0
var florality = 0
var spicedness = 0
var nuttyness = 0

func get_guest_preferences():
	var temp_lower_bound = $VBox/TemperatureTitleContainer/LowerBound.value
	var temp_upper_bound = $VBox/TemperatureTitleContainer/UpperBound.value
	var astringency_lower_bound = $VBox/AstringencyTitleContainer/LowerBound.value
	var astringency_upper_bound = $VBox/AstringencyTitleContainer/UpperBound.value
	var sweetness_lower_bound = $VBox/SweetnessTitleContainer/LowerBound.value
	var sweetness_upper_bound = $VBox/SweetnessTitleContainer/UpperBound.value
	var florality_lower_bound = $VBox/FloralityTitleContainer/LowerBound.value
	var florality_upper_bound = $VBox/FloralityTitleContainer/UpperBound.value
	var spicedness_lower_bound = $VBox/SpicednessTitleContainer/LowerBound.value
	var spicedness_upper_bound = $VBox/SpicednessTitleContainer/UpperBound.value
	var nuttyness_lower_bound = $VBox/NuttynnessTitleContainer/LowerBound.value
	var nuttyness_upper_bound = $VBox/NuttynnessTitleContainer/UpperBound.value
	
	#return GuestPreferences.new()
func _on_temp_slider_value_changed(value):
	$VBox/TempSliderContainer/TempValue.text = str(value)
	temperature = value

func _on_astringency_slider_value_changed(value):
	$VBox/AstringencySliderContainer/AstringencyValue.text = str(value)
	astringency = value

func _on_sweetness_slider_value_changed(value):
	$VBox/SweetnessSliderContainer/SweetnessValue.text = str(value)
	sweetness = value

func _on_florality_slider_value_changed(value):
	$VBox/FloralitySliderContainer/FloralityValue.text = str(value)
	florality = value

func _on_spicedness_slider_value_changed(value):
	$VBox/SpicednessSliderContainer/SpicednessValue.text = str(value)
	spicedness = value

func _on_nuttyness_slider_value_changed(value):
	$VBox/NuttynessSliderContainer/NuttynessValue.text = str(value)
	nuttyness = value
