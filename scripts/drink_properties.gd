class_name DrinkProperties
extends RefCounted

# Range drink properties
var temperature: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.TEMPERATURE, 0.0)
var astringency: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.ASTRINGENCY, 0.0)
var sweetness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.SWEETNESS, 0.0)
var florality: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.FLORALITY, 0.0)
var spicedness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.SPICEDNESS, 0.0)
var nuttyness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.NUTTYNESS, 0.0)

func _init(_temperature: float = 0.0, _astringency: float = 0.0, _sweetness: float = 0.0, _florality: float = 0.0, _spicedness: float = 0.0, _nuttyness: float = 0.0):
	temperature.value = _temperature
	astringency.value = _astringency
	sweetness.value = _sweetness
	florality.value = _florality
	spicedness.value = _spicedness
	nuttyness.value = _nuttyness

func combine(other: DrinkProperties):
	temperature.value += other.temperature.value
	temperature.value = clampf(temperature.value, 0.0, 10.0)
	astringency.value += other.astringency.value
	astringency.value = clampf(astringency.value, 0.0, 10.0)
	sweetness.value += other.sweetness.value
	sweetness.value = clampf(sweetness.value, 0.0, 10.0)
	florality.value += other.florality.value
	florality.value = clampf(florality.value, 0.0, 10.0)
	spicedness.value += other.spicedness.value
	spicedness.value = clampf(spicedness.value, 0.0, 10.0)
	nuttyness.value += other.nuttyness.value
	nuttyness.value = clampf(nuttyness.value, 0.0, 10.0)

func multiply(value: float):
	temperature.value *= value
	temperature.value = clampf(temperature.value, 0.0, 10.0)
	astringency.value *= value
	astringency.value = clampf(astringency.value, 0.0, 10.0)
	sweetness.value *= value
	sweetness.value = clampf(sweetness.value, 0.0, 10.0)
	florality.value *= value
	florality.value = clampf(florality.value, 0.0, 10.0)
	spicedness.value *= value
	spicedness.value = clampf(spicedness.value, 0.0, 10.0)
	nuttyness.value *= value
	nuttyness.value = clampf(nuttyness.value, 0.0, 10.0)
