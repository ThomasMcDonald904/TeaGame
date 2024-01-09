extends Node

@export var container_fill_requests: Array[ContainerFillRequest]
@export var target_container: ItemContainer
@export var override_inventory: bool =false
# Called when the node enters the scene tree for the first time.

func fill_target():
	if target_container.inventory.size() > 0 && !override_inventory:
		return
	for request in container_fill_requests:
		for n in request.item_count:
			var item = request.item_to_add.instantiate()
			target_container.inventory.append(item)

func _ready():
	fill_target()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
