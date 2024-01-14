extends Node

func get_current_market_stock() -> Array[Ingredient]:
	var items: Array[Ingredient]
	var current_stock: Array[Ingredient]
	var ingredients_dir: DirAccess = DirAccess.open("res://ingredients/")
	for item_name in ingredients_dir.get_files():
		var filename: String = ingredients_dir.get_current_dir() + "/" + item_name
		var item = load(filename) as Ingredient
		items.append(item)
	for item in items:
		if is_in_stock(item.rarity):
			for i in range(item.market_rarity):
				current_stock.append(item)
	return current_stock

func is_in_stock(percent_change: float):
	return randf() <= (clamp(percent_change, 0, 100)/100)
