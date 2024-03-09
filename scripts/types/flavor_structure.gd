class_name FlavorStructure
extends Resource

@export var normal_flavor: DrinkProperty.PropertyType = DrinkProperty.PropertyType.NONE
@export var normal_flavor_intensity_value: int
@export var is_changed_by_heat: bool = false
@export var heated_flavor: DrinkProperty.PropertyType = DrinkProperty.PropertyType.NONE
@export var heated_flavor_intensity_value: int
