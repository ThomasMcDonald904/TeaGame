extends Node

signal steeper_ingredients_changed()
signal day_changed

var money: int = 20

var has_item: bool = false
var item_held: RigidBody2D
var selected_inventory_object

var can_open_container: bool = true

var current_guest_preferences: GuestProfile

var current_day: int = 1 : 
	set(value): 
		current_day = value
		day_changed.emit()

var days_to_prepare: int = 2

var steeper_ingredients: Array[Ingredient] = []
var inventories: Array[ContainerInventory] = []
