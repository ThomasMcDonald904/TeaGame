extends Node

@onready var resource_preloader = $ResourcePreloader

var main_menu_scene
var brewdio_scene: Brewdio
var office_scene
var tea_room_scene

# Cal$AnimationPlayerled when the node enters the scene tree for the first time.
func _ready():
	GameState.enter_main_menu.connect(show_main_menu)
	GameState.enter_brewdio.connect(show_brewdio)
	GameState.enter_office.connect(show_office)
	GameState.enter_tea_room.connect(show_tea_room)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func show_main_menu():
	var main_menu_packed_scene:PackedScene = resource_preloader.get_resource("main_menu")
	main_menu_scene = main_menu_packed_scene.instantiate()
	add_child(main_menu_scene)

func show_brewdio():
	var brewdio_packed_scene:PackedScene = resource_preloader.get_resource("brewdio")
	brewdio_scene = brewdio_packed_scene.instantiate()
	if main_menu_scene != null:
		main_menu_scene.queue_free()
	if office_scene != null:
		office_scene.queue_free()
	if tea_room_scene != null:
		tea_room_scene.queue_free()
	brewdio_scene.connect("goto_tea_room", func(): GameState.tassle_tugged = true)
	add_child(brewdio_scene)

func show_office():
	var office_packed_scene: PackedScene = resource_preloader.get_resource("office")
	office_scene = office_packed_scene.instantiate()
	if main_menu_scene != null:
		main_menu_scene.queue_free()
	if brewdio_scene != null:
		brewdio_scene.queue_free()
	if tea_room_scene != null:
		tea_room_scene.queue_free()
	add_child(office_scene)

func show_tea_room():
	var tea_room_packed_scene: PackedScene = resource_preloader.get_resource("tea_room")
	tea_room_scene = tea_room_packed_scene.instantiate()
	if main_menu_scene != null:
		main_menu_scene.queue_free()
	if brewdio_scene != null:
		brewdio_scene.populate_global_steeper_ingredients()
		brewdio_scene.queue_free()
	if office_scene != null:
		office_scene.queue_free()
	add_child(tea_room_scene)
