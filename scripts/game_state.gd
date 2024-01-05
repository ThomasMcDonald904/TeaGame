extends AnimationTree

signal enter_main_menu()
signal enter_brewdio()
signal enter_office()
signal enter_tea_room()

@export var start : bool = false
@export var first_time_experience: bool = true
@export var letter_read: bool = false
@export var brewdio_door_clicked: bool = false
@export var tassle_tugged: bool = false
@export var tea_session_done: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
