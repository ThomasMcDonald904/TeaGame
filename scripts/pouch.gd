extends AnimatedSprite2D

var inventory = []
var test_item = preload("res://scenes/item.tscn")
var is_opened = false
var is_mouse_on_pouch = false
var has_item = false
var item_held: RigidBody2D
@onready var initial_position = get_global_position()

func _ready():
	$"../PouchCollider/Area2D".connect("mouse_entered", mouse_enter_pouch)
	$"../PouchCollider/Area2D".connect("mouse_exited", mouse_exit_pouch)
	for i in range(4):
		var inst = test_item.instantiate()
		inventory.append(inst)

func _on_area_2d_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed("click") and not is_opened:
		%Polygon2D.set_deferred("disabled", false)
		spawn_items()
		var _animation = $AnimationPlayer.get_animation("Opening")
		_animation.track_set_key_value(_animation.find_track(".:position", 0), 0, initial_position)
		$AnimationPlayer.play("Opening")

func spawn_items():
	for item:RigidBody2D in inventory:
		add_child(item)
		item.global_position = get_tree().get_nodes_in_group("spawn_points").pick_random().global_position
		item.apply_central_impulse(Vector2(randi_range(-200,200),0))
		item.visible = false
		await get_tree().create_timer(0.05).timeout

func _unhandled_input(event):
	if event.is_action_pressed("click") and not is_mouse_on_pouch and is_opened:
		close_pouch(null)

func set_items_visible():
	if is_opened:
		for item in inventory:
			item.visible = true

func close_pouch(chosen_item):
	for child in get_children():
		if child in inventory and child != chosen_item:
			remove_child(child)
		if child == chosen_item:
			inventory.erase(child)
	var _animation = $AnimationPlayer.get_animation("Closing")
	_animation.track_set_key_value(_animation.find_track(".:position", 0), 1, initial_position)
	$AnimationPlayer.play("Closing")
	if chosen_item != null:
		chosen_item.call_deferred("reparent", get_tree().current_scene)
	%Polygon2D.set_deferred("disabled", true)

func mouse_enter_pouch():
	is_mouse_on_pouch = true

func mouse_exit_pouch():
	is_mouse_on_pouch = false
	if has_item and is_opened:
		close_pouch(item_held)

func holding_item(chosen_item):
	item_held = chosen_item
	has_item = true

func released_item():
	has_item = false
	item_held = null
