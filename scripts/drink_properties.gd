class_name DrinkProperties
extends RefCounted

# Range drink properties
var astringency: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.ASTRINGENCY, 0)
var sweetness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.SWEETNESS, 0)
var florality: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.FLORALITY, 0)
var spicedness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.SPICEDNESS, 0)
var nuttyness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.NUTTYNESS, 0)

func _init(_astringency: int = 0, _sweetness: int = 0, _florality: int = 0, _spicedness: int = 0, _nuttyness: int = 0):
	astringency.value = _astringency
	sweetness.value = _sweetness
	florality.value = _florality
	spicedness.value = _spicedness
	nuttyness.value = _nuttyness

func combine(other: DrinkProperties):
	astringency.value += other.astringency.value
	astringency.value = clampf(astringency.value, 0, 10)
	sweetness.value += other.sweetness.value
	sweetness.value = clampf(sweetness.value, 0, 10)
	florality.value += other.florality.value
	florality.value = clampf(florality.value, 0, 10)
	spicedness.value += other.spicedness.value
	spicedness.value = clampf(spicedness.value, 0, 10)
	nuttyness.value += other.nuttyness.value
	nuttyness.value = clampf(nuttyness.value, 0, 10)

func multiply(value: float):
	astringency.value *= value
	astringency.value = clampi(astringency.value, 0, 10)
	sweetness.value *= value
	sweetness.value = clampi(sweetness.value, 0, 10)
	florality.value *= value
	florality.value = clampi(florality.value, 0, 10)
	spicedness.value *= value
	spicedness.value = clampi(spicedness.value, 0, 10)
	nuttyness.value *= value
	nuttyness.value = clampi(nuttyness.value, 0, 10)
