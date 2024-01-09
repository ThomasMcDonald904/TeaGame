class_name IngredientItemMap extends Resource

@export var ingredient_item_pairs: Array[IngredientItemPair]

func find_pair(ingredient: Ingredient) -> IngredientItemPair:
	for pair in ingredient_item_pairs:
		if pair.ingredient.name == ingredient.name:
			return pair
	return null
