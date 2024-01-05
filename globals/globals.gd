extends Node

signal steeper_ingredients_changed()

var has_item: bool = false
var item_held: RigidBody2D
var selected_inventory_object

var can_open_container: bool = true

var current_guest_preferences: GuestProfile

var steeper_ingredients: Array[Ingredient] = []
#func _process(delta):
	#print(has_item, item_held, selected_inventory_object)
