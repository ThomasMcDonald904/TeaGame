class_name DrinkProperty
extends Resource

enum PropertyType {ASTRINGENCY, SWEETNESS, FLORALITY, SPICE, NUTTINESS, NONE}
@export var type : PropertyType = PropertyType.NONE

@export_range(0, 10) var value: int:  # 0 to 10
	set(v):
		value = v
		value = clampi(value, 0, 10)
	get:
		return value

func _init(property_type: PropertyType, property_value: int = 0):
	type = property_type
	value = property_value
