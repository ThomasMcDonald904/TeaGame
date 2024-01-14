class_name ItemContainer extends AnimatedSprite2D

var inventory: Array[Item] = []
@export var is_opened = false
var is_mouse_on_container = false
@onready var initial_position = get_global_position()
@export var collider: StaticBody2D
@export var starting_items: Array[PackedScene] = []
@export var area2d: Area2D
@export var animation_player: AnimationPlayer

var item_spawn_timer: Timer

func _ready():
	collider.get_node("Area2D").connect("mouse_entered", mouse_enter_container)
	collider.get_node("Area2D").connect("mouse_exited", mouse_exit_container)
	collider.get_node("Collider").disabled = true
	area2d.connect("input_event", _on_area_2d_input_event)
	area2d.connect("body_entered", _on_area_2d_body_entered)
	area2d.connect("body_exited", _on_area_2d_body_exited)
	animation_player.connect("animation_finished", _on_animation_player_animation_finished)
	animation_player.connect("animation_started", _on_animation_player_animation_started)
	tree_exiting.connect(is_being_freed)
	# When respawing after deletion, check if there is items to re-add and set it to that
	# Automatically clears items added by ContainerFiller 
	var ingredient_item_map: IngredientItemMap = load("res://ingredients/item_map/ingredient_item_map.tres")
	var check_index = Globals.inventories.map(func(x: ContainerInventory): return x.container_name).find(name)
	if check_index != -1:
		for ingredient in Globals.inventories[check_index].inventory:
			var pair: IngredientItemPair = ingredient_item_map.find_pair(ingredient)
			if pair != null:
				inventory.append(pair.item.instantiate())
	else:
		for item in starting_items:
			inventory.append(item.instantiate())
	item_spawn_timer = Timer.new()

func _on_area_2d_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed("click") and not is_opened and Globals.can_open_container:
		Globals.can_open_container = false
		collider.get_node("Collider").set_deferred("disabled", false)
		spawn_items()
		var _animation = animation_player.get_animation("Opening")
		_animation.track_set_key_value(_animation.find_track(".:position", 0), 0, initial_position)
		animation_player.play("Opening")

func spawn_items():
	for item: RigidBody2D in inventory:
		add_child(item)
		item.global_position = collider.get_node("SpawnPoints").get_children().pick_random().global_position
		item.apply_central_impulse(Vector2(randi_range(-200,200),0))
		item.visible = false
		await get_tree().create_timer(0.05).timeout

func _unhandled_input(event):
	if event.is_action_pressed("click") and not is_mouse_on_container and is_opened and Globals.can_open_container:
		close_container(null)

func set_items_visible():
	if is_opened:
		for item in inventory:
			item.visible = true

func close_container(chosen_item: Item):
	for child in get_children():
		if (child as Item) in inventory and child != chosen_item:
			remove_child(child)
		if child == chosen_item:
			inventory.erase(child)
	var _animation = animation_player.get_animation("Closing")
	_animation.track_set_key_value(_animation.find_track(".:position", 0), 1, initial_position)
	animation_player.play("Closing")
	if chosen_item != null:
		chosen_item.call_deferred("reparent", get_tree().current_scene)
		chosen_item.get_node("Collider").set_deferred("disabled", false)
	collider.get_node("Collider").set_deferred("disabled", true)
	
func mouse_enter_container():
	is_mouse_on_container = true

func mouse_exit_container():
	is_mouse_on_container = false
	if Globals.has_item and is_opened:
		Globals.can_open_container = false
		close_container(Globals.item_held)


func _on_area_2d_body_entered(_body):
	if not is_opened and Globals.has_item:
		animation = "selected"
		Globals.selected_inventory_object = self

func _on_area_2d_body_exited(_body):
	if not is_opened:
		animation = "closed"
		Globals.selected_inventory_object = null


func _on_animation_player_animation_finished(_anim_name):
	Globals.can_open_container = true
	if _anim_name == "Opening":
		is_opened = true
		set_items_visible()
	if _anim_name == "Closing":
		is_opened = false

func _on_animation_player_animation_started(_anim_name):
	Globals.can_open_container = false
	if _anim_name == "Opening":
		is_opened = false

func is_being_freed():
	Globals.inventories.append(ContainerInventory.new(name, inventory))

