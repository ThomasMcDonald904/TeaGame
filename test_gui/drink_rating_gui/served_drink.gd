extends Panel


func _on_temp_slider_value_changed(value):
	$VBox/TempSliderContainer/TempValue.text = str(value)


func _on_astringency_slider_value_changed(value):
	$VBox/AstringencySliderContainer/AstringencyValue.text = str(value)


func _on_sweetness_slider_value_changed(value):
	$VBox/SweetnessSliderContainer/SweetnessValue.text = str(value)


func _on_florality_slider_value_changed(value):
	$VBox/FloralitySliderContainer/FloralityValue.text = str(value)


func _on_spicedness_slider_value_changed(value):
	$VBox/SpicednessSliderContainer/SpicednessValue.text = str(value)


func _on_nuttyness_slider_value_changed(value):
	$VBox/NuttynessSliderContainer/NuttynessValue.text = str(value)
