class_name GuestPreferences extends DrinkProperties

var temperature_tolerance_lower_bound: float:
	set(value):
		temperature_tolerance_lower_bound = value
	get:
		return temperature_tolerance_lower_bound
var temperature_tolerance_upper_bound: float:
	set(value):
		temperature_tolerance_upper_bound = value
	get:
		return temperature_tolerance_upper_bound
var astringency_tolerance_lower_bound: float:
	set(value):
		astringency_tolerance_lower_bound = value
	get:
		return astringency_tolerance_lower_bound
var astringency_tolerance_upper_bound: float:
	set(value):
		astringency_tolerance_upper_bound = value
	get:
		return astringency_tolerance_upper_bound
var sweetness_tolerance_lower_bound: float:
	set(value):
		sweetness_tolerance_lower_bound = value
	get:
		return sweetness_tolerance_lower_bound
var sweetness_tolerance_upper_bound: float:
	set(value):
		sweetness_tolerance_upper_bound = value
	get:
		return sweetness_tolerance_upper_bound
var florality_tolerance_lower_bound: float:
	set(value):
		florality_tolerance_lower_bound = value
	get:
		return florality_tolerance_lower_bound
var florality_tolerance_upper_bound: float:
	set(value):
		florality_tolerance_upper_bound = value
	get:
		return florality_tolerance_upper_bound
var spicedness_tolerance_lower_bound: float:
	set(value):
		spicedness_tolerance_lower_bound = value
	get:
		return spicedness_tolerance_lower_bound
var spicedness_tolerance_upper_bound: float:
	set(value):
		spicedness_tolerance_upper_bound = value
	get:
		return spicedness_tolerance_upper_bound
var nuttyness_tolerance_lower_bound: float:
	set(value):
		nuttyness_tolerance_lower_bound = value
	get:
		return nuttyness_tolerance_lower_bound
var nuttyness_tolerance_upper_bound: float:
	set(value):
		nuttyness_tolerance_upper_bound = value
	get:
		return nuttyness_tolerance_upper_bound

func _init(_temperature: float = 0.0, _astringency: float = 0.0, _sweetness: float = 0.0, _florality: float = 0.0, _spicedness: float = 0.0, _nuttyness: float = 0.0, 
	_temp_lower_bound: float = 0.0, _temp_upper_bound: float = 0.0, _astringency_lower_bound: float = 0.0, _astringency_upper_bound: float = 0.0,
	_sweetness_lower_bound: float = 0.0, _sweetness_upper_bound: float = 0.0, _florality_lower_bound: float = 0.0, _florality_upper_bound: float = 0.0,
	_spicedness_lower_bound: float = 0.0, _spicedness_upper_bound: float = 0.0, _nuttyness_lower_bound: float = 0.0, _nuttyness_upper_bound: float = 0.0):
	super._init(_temperature, _astringency, _sweetness, _florality, _spicedness, _nuttyness)
	temperature_tolerance_lower_bound = _temp_lower_bound
	temperature_tolerance_upper_bound = _temp_upper_bound
	assert(temperature_tolerance_lower_bound <= _temperature and _temperature <= temperature_tolerance_upper_bound, "Preference must be within lower and upper bound")
	astringency_tolerance_lower_bound = _astringency_lower_bound
	astringency_tolerance_upper_bound = _astringency_upper_bound
	assert(astringency_tolerance_lower_bound <= _astringency and _astringency <= astringency_tolerance_upper_bound, "Preference must be within lower and upper bound")
	sweetness_tolerance_upper_bound = _sweetness_lower_bound
	sweetness_tolerance_upper_bound = _sweetness_upper_bound
	assert(sweetness_tolerance_lower_bound <= _sweetness and _sweetness <= sweetness_tolerance_upper_bound, "Preference must be within lower and upper bound")
	florality_tolerance_lower_bound = _florality_lower_bound
	florality_tolerance_upper_bound = _florality_upper_bound
	assert(florality_tolerance_lower_bound <= _florality and _florality <= florality_tolerance_upper_bound, "Preference must be within lower and upper bound")
	spicedness_tolerance_lower_bound = _spicedness_lower_bound
	spicedness_tolerance_upper_bound = _spicedness_upper_bound
	assert(spicedness_tolerance_lower_bound <= _spicedness and _spicedness <= spicedness_tolerance_upper_bound, "Preference must be within lower and upper bound")
	nuttyness_tolerance_lower_bound = _nuttyness_lower_bound
	nuttyness_tolerance_upper_bound = _nuttyness_upper_bound
	assert(nuttyness_tolerance_lower_bound <= _nuttyness and _nuttyness <= nuttyness_tolerance_upper_bound, "Preference must be within lower and upper bound")
