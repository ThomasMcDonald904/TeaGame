extends Node

var daily_market_stock = {}

@export var fetchermann_market_time: int = 1

# This is for the fetchermann to be persistent across scenes
var fetchermann_day_sent: int = -1
var fetchermann_requested_items: Array[Ingredient]
var fetchermann_budget: int = 0
var fetchermann_daily_market_predictions = {}

func _ready():
	get_current_market_stock()

func get_specific_day_stock(day: int):
	if daily_market_stock.has(day):
		return daily_market_stock[day]
	else:
		null

func get_current_market_stock() -> Array[Ingredient]:
	if daily_market_stock.has(Globals.current_day):
		return daily_market_stock[Globals.current_day]
	var items: Array[Ingredient]
	var current_stock: Array[Ingredient]
	var ingredients_dir: DirAccess = DirAccess.open("res://ingredients/")
	for item_name in ingredients_dir.get_files():
		var filename: String = ingredients_dir.get_current_dir() + "/" + item_name
		var item = load(filename) as Ingredient
		items.append(item)
	for item in items:
		if is_in_stock(item.rarity):
			for i in range(item.market_quantity):
				current_stock.append(item)
	daily_market_stock[Globals.current_day] = current_stock
	return current_stock

func is_in_stock(percent_change: float):
	return randf() <= (clamp(percent_change, 0, 100)/100)
