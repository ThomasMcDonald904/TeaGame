class_name DrinkProperties
extends RefCounted

# Range drink properties
var temperature: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.TEMPERATURE, 5.0)
var astringency: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.ASTRINGENCY, 5.0)
var sweetness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.SWEETNESS, 5.0)
var florality: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.FLORALITY, 5.0)
var spicedness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.SPICEDNESS, 5.0)
var nuttyness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.NUTTYNESS, 5.0)

func _init(_temperature: float = 0.0, _astringency: float = 0.0, _sweetness: float = 0.0, _florality: float = 0.0, _spicedness: float = 0.0, _nuttyness: float = 0.0):
	temperature.value = _temperature
	astringency.value = _astringency
	sweetness.value = _sweetness
	florality.value = _florality
	spicedness.value = _spicedness
	nuttyness.value = _nuttyness
