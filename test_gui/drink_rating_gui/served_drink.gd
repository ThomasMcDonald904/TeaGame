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
	$VBox/TempSliderContainer/TempValue.text = "%04.1f"%value
	temperature = value


func _on_astringency_slider_value_changed(value):
	$VBox/AstringencySliderContainer/AstringencyValue.text = "%04.1f"%value
	astringency = value


func _on_sweetness_slider_value_changed(value):
	$VBox/SweetnessSliderContainer/SweetnessValue.text = "%04.1f"%value
	sweetness = value


func _on_florality_slider_value_changed(value):
	$VBox/FloralitySliderContainer/FloralityValue.text = "%04.1f"%value
	florality = value


func _on_spicedness_slider_value_changed(value):
	$VBox/SpicednessSliderContainer/SpicednessValue.text = "%04.1f"%value
	spicedness = value


func _on_nuttyness_slider_value_changed(value):
	$VBox/NuttynessSliderContainer/NuttynessValue.text = "%04.1f"%value
	nuttyness = value
