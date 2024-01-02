class_name DrinkPreferenceDebug
extends VBoxContainer

signal changed()

@onready var property_name: Label = $TemperatureTitleContainer/PropertyName
@onready var lower_bound: SpinBox = $TemperatureTitleContainer/LowerBound
@onready var upper_bound: SpinBox = $TemperatureTitleContainer/UpperBound
@onready var slider: HSlider = $SliderContainer/Slider
@onready var value_label: Label = $SliderContainer/Value

var drink_preference: DrinkPropertyPreference

# Called when the node enters the scene tree for the first time.
func _ready():
	if(drink_preference != null):
		set_drink_preference(drink_preference)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_drink_preference(new_drink_preference: DrinkPropertyPreference) -> void:
	drink_preference = new_drink_preference
	if !is_node_ready():
		return
	property_name.text = drink_preference.PropertyType.keys()[drink_preference.type]
	lower_bound.set_value_no_signal(drink_preference.lower_bound)
	upper_bound.set_value_no_signal(drink_preference.upper_bound)
	slider.set_value_no_signal(drink_preference.value)
	value_label.text = "%04.1f"%drink_preference.value
	
func _on_slider_value_changed(value):
	value_label.text = "%04.1f"%value
	drink_preference.value = value
	if value < lower_bound.value:
		lower_bound.set_value_no_signal(value)
		drink_preference.lower_bound = value
	if value > upper_bound.value:
		upper_bound.set_value_no_signal(value)
		drink_preference.upper_bound = value
	changed.emit()

func _on_lower_bound_value_changed(value):
	if value > upper_bound.value:
		upper_bound.set_value_no_signal(value)
	drink_preference.lower_bound = value
	if drink_preference.value < value:
		drink_preference.value = value
		slider.set_value_no_signal(value)
		value_label.text = "%04.1f"%value
	changed.emit()

func _on_upper_bound_value_changed(value):
	if value < lower_bound.value:
		lower_bound.set_value_no_signal(value)
	drink_preference.upper_bound = value
	if drink_preference.value > value:
		drink_preference.value = value
		slider.set_value_no_signal(value)
		value_label.text = "%04.1f"%value
	changed.emit()
