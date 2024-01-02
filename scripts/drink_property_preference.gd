class_name DrinkPropertyPreference
extends DrinkProperty

@export var lower_bound: float
@export var upper_bound: float

func _init(property_type: PropertyType, property_value: float = 5.0, min: float = 3, max: float = 7.0):
	super(property_type, property_value)
	lower_bound = min
	upper_bound = max
