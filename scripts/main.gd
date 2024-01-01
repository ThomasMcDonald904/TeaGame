extends Node

@onready var resource_preloader = $ResourcePreloader

var main_menu_scene
var brewdio_scene

# Cal$AnimationPlayerled when the node enters the scene tree for the first time.
func _ready():
	GameState.enter_main_menu.connect(show_main_menu)
	GameState.enter_brewdio.connect(show_brewdio)

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
	add_child(brewdio_scene)
