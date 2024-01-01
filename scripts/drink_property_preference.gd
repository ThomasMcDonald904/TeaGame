class_name DrinkPropertyPreference
extends DrinkProperty

var lower_bound: float
var upper_bound: float

func _init(property_type: PropertyType, property_value: float = 5.0, min: float = 0, max: float = 10.0):
	super(property_type, property_value)
	lower_bound = min
	upper_bound = max
