class_name GuestPreferences 
extends RefCounted

var astringency_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.ASTRINGENCY)
var sweetness_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.SWEETNESS)
var florality_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.FLORALITY)
var spicedness_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.SPICEDNESS)
var nuttyness_preference: DrinkPropertyPreference = DrinkPropertyPreference.new(DrinkProperty.PropertyType.NUTTYNESS)

func _init(_astringency: int = 0, _sweetness: int = 0, _florality: int = 0, _spicedness: int = 0, _nuttyness: int = 0, 
	 _astringency_lower_bound: int = 0, _astringency_upper_bound: int = 0,
	_sweetness_lower_bound: int = 0, _sweetness_upper_bound: int = 0, _florality_lower_bound: int = 0, _florality_upper_bound: int = 0,
	_spicedness_lower_bound: int = 0, _spicedness_upper_bound: int = 0, _nuttyness_lower_bound: int = 0, _nuttyness_upper_bound: int = 0):
	
	astringency_preference.value = _astringency
	astringency_preference.lower_bound = _astringency_lower_bound
	astringency_preference.upper_bound = _astringency_upper_bound
	
	sweetness_preference.value = _sweetness
	sweetness_preference.lower_bound = _sweetness_lower_bound
	sweetness_preference.upper_bound = _sweetness_upper_bound

	florality_preference.value = _florality
	florality_preference.lower_bound = _florality_lower_bound
	florality_preference.upper_bound = _florality_upper_bound

	spicedness_preference.value = _spicedness
	spicedness_preference.lower_bound = _spicedness_lower_bound
	spicedness_preference.upper_bound = _spicedness_upper_bound

	nuttyness_preference.value = _nuttyness
	nuttyness_preference.lower_bound = _nuttyness_lower_bound
	nuttyness_preference.upper_bound = _nuttyness_upper_bound
