class_name Ingredient
extends Resource

@export var name: String
@export var name_regex: String:
	get:
		if name_regex == "":
			return "(?i)" + name
		return name_regex
# Percent change of being sold at the market
# If rarity is set to 100%, it will always be sold and be displayed on the fetchermann's
# ingredient predictions page
@export var rarity: float = 70
# Amount available if sold at the market
@export var market_quantity: int = 4
@export var sell_price: int = 5

@export var flavor_queue: Array[FlavorStructure]

func get_flavour_from_queue(index: int) -> FlavorStructure:
	if index > flavor_queue.size() - 1:
		var none_flavor = FlavorStructure.new()
		none_flavor.normal_flavor = DrinkProperty.new(DrinkProperty.PropertyType.NONE, 0)
		return none_flavor
	return flavor_queue[index]

