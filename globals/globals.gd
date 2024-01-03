extends Node

var has_item: bool = false
var item_held: RigidBody2D
var selected_inventory_object

var can_open_container: bool = true

#func _process(delta):
	#print(has_item, item_held, selected_inventory_object)
