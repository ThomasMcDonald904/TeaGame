class_name Ingredient
extends Resource

@export var name: String
@export var name_regex: String:
	get:
		if name_regex == "":
			return "(?i)" + name
		return name_regex
@export var property_curves: Array[PropertyTypeCurvePair]
# Percent change of being sold at the market
# If rarity is set to 100%, it will always be sold and be displayed on the fetchermann's
# ingredient predictions page
@export var rarity: float = 70
# Amount available if sold at the market
@export var market_quantity: int = 4
@export var sell_price: int = 5

func get_drink_property_changes(temp: float) -> DrinkProperties:
	var changes: DrinkProperties = DrinkProperties.new()
	
	_set_property_value(changes.temperature, DrinkProperty.PropertyType.TEMPERATURE, temp/10.0)
	_set_property_value(changes.astringency, DrinkProperty.PropertyType.ASTRINGENCY, temp/10.0)
	_set_property_value(changes.sweetness, DrinkProperty.PropertyType.SWEETNESS, temp/10.0)
	_set_property_value(changes.florality, DrinkProperty.PropertyType.FLORALITY, temp/10.0)
	_set_property_value(changes.spicedness, DrinkProperty.PropertyType.SPICEDNESS, temp/10.0)
	_set_property_value(changes.nuttyness, DrinkProperty.PropertyType.NUTTYNESS, temp/10.0)
	
	return changes

func _set_property_value(property: DrinkProperty, type: DrinkProperty.PropertyType, temperature: float):
	var found_item: Array[PropertyTypeCurvePair] = property_curves.filter(func(item: PropertyTypeCurvePair): return item.type == type)
	if found_item.size() > 0:
		property.value = found_item[0].curve.sample(temperature)

func has_curve_for_property(type: DrinkProperty.PropertyType) -> bool:
	for pair: PropertyTypeCurvePair in property_curves:
		if pair.type == type:
			return true
	return false
