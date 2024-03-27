class_name DrinkPropertiesDisplay extends VBoxContainer

var drink_properties: DrinkProperties

@export var temperature_value: Label
@export var astringency_value: Label
@export var sweetness_value: Label
@export var florality_value: Label
@export var spice_value: Label
@export var nuttiness_value: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func refresh_values():
	if drink_properties != null:
		temperature_value.text = 	"Temperature   %5.2f"%drink_properties.temperature.value
		astringency_value.text = 	"Astringency   %5.2f"%drink_properties.astringency.value
		sweetness_value.text = 		"Sweetness     %5.2f"%drink_properties.sweetness.value
		florality_value.text = 		"Florality     %5.2f"%drink_properties.florality.value
		spice_value.text = 	"Spicedness    %5.2f"%drink_properties.spice.value
		nuttiness_value.text = 		"Nuttyness     %5.2f"%drink_properties.nuttiness.value
