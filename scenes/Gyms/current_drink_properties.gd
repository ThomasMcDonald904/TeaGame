class_name DrinkPropertiesDisplay extends VBoxContainer

var drink_properties: DrinkProperties

@export var temperature_value: Label
@export var astringency_value: Label
@export var sweetness_value: Label
@export var florality_value: Label
@export var spicedness_value: Label
@export var nuttyness_value: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func refresh_values():
	if drink_properties != null:
		temperature_value.text = 	"Temperature   %5.2f"%drink_properties.temperature.value
		astringency_value.text = 	"Astringency   %5.2f"%drink_properties.astringency.value
		sweetness_value.text = 		"Sweetness     %5.2f"%drink_properties.sweetness.value
		florality_value.text = 		"Florality     %5.2f"%drink_properties.florality.value
		spicedness_value.text = 	"Spicedness    %5.2f"%drink_properties.spicedness.value
		nuttyness_value.text = 		"Nuttyness     %5.2f"%drink_properties.nuttyness.value
