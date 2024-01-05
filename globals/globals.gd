extends Node

signal steeper_ingredients_changed()

var has_item: bool = false
var item_held: RigidBody2D
var selected_inventory_object

var can_open_container: bool = true

var current_guest_preferences: GuestProfile

var current_day: int = 0
var preparation_days: int = 2

var steeper_ingredients: Array[Ingredient] = []
