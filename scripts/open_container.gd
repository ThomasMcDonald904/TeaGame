class_name OpenContainer extends ItemContainer

@export var is_resting: bool = true

@export var entrance_boundary: Area2D
@export var sides: StaticBody2D
@export var front_face: Sprite2D

func _ready():
	super()
	entrance_boundary.connect("body_entered", entrance_boundary_entered)
	animation_player.connect("animation_finished", open_container_anim_finished)
	animation_player.connect("animation_started", open_container_anim_started)
	sides.get_child(0).disabled = false
	entrance_boundary.get_child(0).disabled = false
	front_face.visible = true
	is_resting = true

func _process(_delta):
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

func open_container_anim_finished(anim_name):
	if anim_name == "Closing":
		is_resting = true
		front_face.visible = true
		sides.get_child(0).disabled = false
		entrance_boundary.get_child(0).disabled = false

func open_container_anim_started(anim_name):
	if anim_name == "Opening":
		front_face.visible = false
		is_resting = false
		sides.get_child(0).disabled = true
		entrance_boundary.get_child(0).disabled = true

