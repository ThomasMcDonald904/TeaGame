extends Panel

var temperature = 0
var astringency = 0
var sweetness = 0
var florality = 0
var spicedness = 0
var nuttyness = 0

func get_drink_preferences():
	return DrinkProperties.new(temperature, astringency, sweetness, florality, spicedness, nuttyness)

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
