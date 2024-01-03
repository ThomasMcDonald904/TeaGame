class_name Ingredient
extends Resource

@export var astringency_change: Curve

func get_drink_property_changes(temp: float) -> DrinkProperties:
	var changes: DrinkProperties = DrinkProperties.new()
	changes.astringency.value = astringency_change.sample(temp)
	
	
	return changes
