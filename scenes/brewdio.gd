extends Node2D

@export var steeper: OpenContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func populate_global_steeper_ingredients():
	for item in steeper.inventory:
		if (item as Item).ingredient != null:
			Globals.steeper_ingredients.clear()
			Globals.steeper_ingredients.append((item as Item).ingredient)
	Globals.steeper_ingredients_changed.emit()
