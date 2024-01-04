class_name Brew
extends RefCounted

var drink_property: DrinkProperties = DrinkProperties.new()
var ingredients: Array[Ingredient]

func tick(delta_time: float):
	for ingredient in ingredients:
		var ingredient_effect: DrinkProperties = ingredient.get_drink_property_changes(drink_property.temperature.value)
		ingredient_effect.multiply(delta_time)
		drink_property.combine(ingredient_effect)
