extends Node

signal steeper_ingredients_changed()
signal day_changed

var money: int = 200

var has_item: bool = false
var item_held: RigidBody2D
var held_fetchermann_items: Array[Item] = []
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

var amount_of_tea_being_processed: int = 0
var being_processed_into: Ingredient
var day_processing_started: int = 0
