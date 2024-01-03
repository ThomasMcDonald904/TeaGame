class_name OpenContainer extends ItemContainer

@export var is_resting: bool = true

@export var entrance_boundary: Area2D
@export var sides: StaticBody2D

func _ready():
	super()
	entrance_boundary.connect("body_entered", entrance_boundary_entered)
	

func _process(delta):
	if Globals.item_held:
		sides.get_child(0).disabled = true
	else:
		sides.get_child(0).disabled = false

# Steeper doesn't have a selection highlighting function
func _on_area_2d_body_entered(_body):
	pass

func _on_area_2d_body_exited(_body):
	pass


func entrance_boundary_entered(body):
	if is_resting and body.get_parent() != self:
		Globals.selected_inventory_object = self
		body.in_open_container = true
