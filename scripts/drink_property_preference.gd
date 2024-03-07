class_name DrinkPropertyPreference
extends DrinkProperty

@export var lower_bound: float
@export var upper_bound: float
@export var ignored: bool = true

func _init(property_type: PropertyType, property_value: int = 0, min: int = 0, max: int = 10):
	super(property_type, property_value)
	lower_bound = min
	upper_bound = max
