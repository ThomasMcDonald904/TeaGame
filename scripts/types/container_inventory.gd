class_name ContainerInventory 
extends Resource

var container_name: String
var inventory: Array[Item]

func _init(_container_name: String, _inventory: Array[Item]):
	container_name = _container_name
	inventory = _inventory

