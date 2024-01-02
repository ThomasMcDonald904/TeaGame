extends RigidBody2D

var follow_mouse: bool = false

var bag_exit_signal_sent = false

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
			get_parent().call_deferred("remove_child", self)
		else:
			follow_mouse = false
			Globals.has_item = false
			Globals.item_held = null
			linear_velocity = Vector2.ZERO
			$CollisionShape2D.set_deferred("disabled", false)


func _on_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed("click"):
		if self.get_parent() != null:
			$CollisionShape2D.set_deferred("disabled", true)
		else:
			$CollisionShape2D.set_deferred("disabled", false)
		follow_mouse = true
		Globals.has_item = true
		Globals.item_held = self
