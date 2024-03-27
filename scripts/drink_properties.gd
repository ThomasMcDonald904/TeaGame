class_name DrinkProperties
extends RefCounted

# Range drink properties
var astringency: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.ASTRINGENCY, 0)
var sweetness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.SWEETNESS, 0)
var florality: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.FLORALITY, 0)
var spice: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.SPICE, 0)
var nuttiness: DrinkProperty = DrinkProperty.new(DrinkProperty.PropertyType.NUTTINESS, 0)

func _init(_astringency: int = 0, _sweetness: int = 0, _florality: int = 0, _spice: int = 0, _nuttiness: int = 0):
	astringency.value = _astringency
	sweetness.value = _sweetness
	florality.value = _florality
	spice.value = _spice
	nuttiness.value = _nuttiness

func combine(other: DrinkProperties):
	astringency.value += other.astringency.value
	astringency.value = clampf(astringency.value, 0, 10)
	sweetness.value += other.sweetness.value
	sweetness.value = clampf(sweetness.value, 0, 10)
	florality.value += other.florality.value
	florality.value = clampf(florality.value, 0, 10)
	spice.value += other.spice.value
	spice.value = clampf(spice.value, 0, 10)
	nuttiness.value += other.nuttiness.value
	nuttiness.value = clampf(nuttiness.value, 0, 10)

func multiply(value: float):
	astringency.value *= value
	astringency.value = clampi(astringency.value, 0, 10)
	sweetness.value *= value
	sweetness.value = clampi(sweetness.value, 0, 10)
	florality.value *= value
	florality.value = clampi(florality.value, 0, 10)
	spice.value *= value
	spice.value = clampi(spice.value, 0, 10)
	nuttiness.value *= value
	nuttiness.value = clampi(nuttiness.value, 0, 10)
