class_name GuestPreferences 
extends RefCounted

var astringency_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.ASTRINGENCY)
var sweetness_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.SWEETNESS)
var florality_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.FLORALITY)
var spice_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.SPICE)
var nuttiness_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.NUTTINESS)

func _init(_astringency: int = 0, _sweetness: int = 0, _florality: int = 0, _spice: int = 0, _nuttiness: int = 0, 
	 _astringency_lower_bound: int = 0, _astringency_upper_bound: int = 0,
	_sweetness_lower_bound: int = 0, _sweetness_upper_bound: int = 0, _florality_lower_bound: int = 0, _florality_upper_bound: int = 0,
	_spice_lower_bound: int = 0, _spice_upper_bound: int = 0, _nuttiness_lower_bound: int = 0, _nuttiness_upper_bound: int = 0):
	
	astringency_preference.value = _astringency
	astringency_preference.lower_bound = _astringency_lower_bound
	astringency_preference.upper_bound = _astringency_upper_bound
	
	sweetness_preference.value = _sweetness
	sweetness_preference.lower_bound = _sweetness_lower_bound
	sweetness_preference.upper_bound = _sweetness_upper_bound

	florality_preference.value = _florality
	florality_preference.lower_bound = _florality_lower_bound
	florality_preference.upper_bound = _florality_upper_bound

	spice_preference.value = _spice
	spice_preference.lower_bound = _spice_lower_bound
	spice_preference.upper_bound = _spice_upper_bound

	nuttiness_preference.value = _nuttiness
	nuttiness_preference.lower_bound = _nuttiness_lower_bound
	nuttiness_preference.upper_bound = _nuttiness_upper_bound
