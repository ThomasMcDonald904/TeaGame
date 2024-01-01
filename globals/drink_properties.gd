class_name DrinkProperties

# Range drink properties
var temperature: float:  # 0 to 10, cold to boiling
	set(value):
		assert(0 <= value and value <= 10, "Drink property temperature must be a within a range of 0 to 10")
		temperature = value
	get:
		return temperature
var astringency: float:  # 0 to 10
	set(value):
		assert(0 <= value and value <= 10, "Drink property astringency must be a within a range of 0 to 10")
		astringency = value
	get:
		return astringency
var sweetness: float:  # 0 to 10
	set(value):
		assert(0 <= value and value <= 10, "Drink property sweetness must be a within a range of 0 to 10")
		sweetness = value
	get:
		return sweetness

var florality: float:  # 0 to 10
	set(value):
		assert(0 <= value and value <= 10, "Drink property florality must be a within a range of 0 to 10")
		florality = value
	get:
		return florality
var spicedness: float:  # 0 to 10
	set(value):
		assert(0 <= value and value <= 10, "Drink property spicedness must be a within a range of 0 to 10")
		spicedness = value
	get:
		return spicedness
var nuttyness: float:  # 0 to 10
	set(value):
		assert(0 <= value and value <= 10, "Drink property nuttyness must be a within a range of 0 to 10")
		nuttyness = value
	get:
		return nuttyness

func _init(_temperature: float = 0.0, _astringency: float = 0.0, _sweetness: float = 0.0, _florality: float = 0.0, _spicedness: float = 0.0, _nuttyness: float = 0.0):
	temperature = _temperature
	astringency = _astringency
	sweetness = _sweetness
	florality = _florality
	spicedness = _spicedness
	nuttyness = _nuttyness
