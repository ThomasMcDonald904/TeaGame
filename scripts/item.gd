extends RigidBody2D

var follow_mouse: bool = false
@export var in_open_container: bool = false

func _ready():
	input_event.connect(_on_input_event, 3)

func _integrate_forces(_state):
	if follow_mouse:
		global_position = get_global_mouse_position()
	if Input.is_action_just_released("click"):
		if Globals.selected_inventory_object != null:
			follow_mouse = false
			Globals.has_item = false
			Globals.item_held = null
			Globals.selected_inventory_object.inventory.append(self)
			Globals.selected_inventory_object = null
			get_parent().call_deferred("remove_child", self)
		else:
			$Collider.set_deferred("disabled", false)
			follow_mouse = false
			Globals.selected_inventory_object = null
			Globals.has_item = false
			Globals.item_held = null
			linear_velocity = Vector2.ZERO
	elif in_open_container:
		in_open_container = false
		follow_mouse = false
		Globals.has_item = false
		Globals.item_held = null
		Globals.selected_inventory_object.inventory.append(self)
		Globals.selected_inventory_object = null
		get_parent().call_deferred("remove_child", self)


func _on_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed("click"):
		if self.get_parent() == get_tree().current_scene:
			$Collider.set_deferred("disabled", false)
		else:
			$Collider.set_deferred("disabled", true)
		follow_mouse = true
		Globals.has_item = true
		Globals.item_held = self
