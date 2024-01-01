class_name DrinkProperty
extends RefCounted

enum PropertyType {TEMPERATURE, ASTRINGENCY, SWEETNESS, FLORALITY, SPICEDNESS, NUTTYNESS, NONE}
@export var type : PropertyType = PropertyType.NONE

var value: float:  # 0 to 10
	set(v):
		assert(0 <= v and v <= 10, "Drink property must be a within a range of 0 to 10")
		value = v
	get:
		return value

func _init(property_type: PropertyType, property_value: float = 5):
	type = property_type
	value = property_value
