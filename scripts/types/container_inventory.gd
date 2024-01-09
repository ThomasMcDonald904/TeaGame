class_name ContainerInventory 
extends Resource

var container_name: String
var inventory: Array[Ingredient]

func _init(_container_name: String, _inventory: Array[Item]):
	container_name = _container_name
	for item in _inventory:
		inventory.append(item.ingredient.duplicate())
