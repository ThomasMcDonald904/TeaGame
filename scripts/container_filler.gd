extends Node

@export var container_fill_requests: Array[ContainerFillRequest]
@export var target_container: ItemContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	for request in container_fill_requests:
		for n in request.item_count:
			var item = request.item_to_add.instantiate()
			target_container.inventory.append(item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
