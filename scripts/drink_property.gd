class_name DrinkProperty
extends Resource

enum PropertyType {TEMPERATURE, ASTRINGENCY, SWEETNESS, FLORALITY, SPICEDNESS, NUTTYNESS, NONE}
@export var type : PropertyType = PropertyType.NONE

@export var value: float:  # 0 to 10
	set(v):
		value = v
		value = clampf(value, 0.0, 10.0)
	get:
		return value

func _init(property_type: PropertyType, property_value: float = 5):
	type = property_type
	value = property_value
