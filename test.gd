extends Node

@export var astringency_curve: Curve

# Called when the node enters the scene tree for the first time.
func _ready():
	print(astringency_curve.sample(0.28))
	var drink_props = DrinkProperties.new(1, 1, 1, 1, 1, 1)
	drink_props.set("sweetness", 10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
