extends RigidBody2D

var follow_mouse: bool = false

signal holding_item(chosen_item)
signal released_item
var bag_exit_signal_sent = false

func _ready():
	holding_item.connect(get_parent().holding_item.bind())
	released_item.connect(get_parent().released_item.bind())

func _integrate_forces(state):
	if follow_mouse:
		global_position = get_global_mouse_position()
	if Input.is_action_just_released("click"):
		follow_mouse = false
		released_item.emit()
		linear_velocity = Vector2.ZERO
		$CollisionShape2D.set_deferred("disabled", false)


func _on_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed("click"):
		$CollisionShape2D.disabled = true
		follow_mouse = true
		holding_item.emit(self)
