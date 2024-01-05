extends Node2D

@export var guest_profiles: Array[Texture2D]
@export var hat_accessories: Array[Texture2D]
@export var glasses_accessories: Array[Texture2D]
@export var scarf_accessories: Array[Texture2D]

@export var hat_offset: int
@export var glasses_offset: int
@export var scarf_offset: int

func _ready():
	var profile_sprite: Sprite2D = $ProfileSprite
	var hat_sprite: Sprite2D = Sprite2D.new()
	var glasses_sprite: Sprite2D = Sprite2D.new()
	var scarf_sprite: Sprite2D = Sprite2D.new()
	profile_sprite.texture = guest_profiles.pick_random()
	hat_sprite.texture = hat_accessories.pick_random()
	glasses_sprite.texture = glasses_accessories.pick_random()
	scarf_sprite.texture = scarf_accessories.pick_random()
	hat_sprite.position.y += hat_offset
	glasses_sprite.position.y += glasses_offset
	scarf_sprite.position.y += scarf_offset
	add_child(hat_sprite)
	add_child(glasses_sprite)
	add_child(scarf_sprite)

func _process(delta):
	#if Input.is_action_just_pressed("click"):
	#	for child in get_children():
	#		child.queue_free()
	#	var profile_sprite: Sprite2D = Sprite2D.new()
	#	var hat_sprite: Sprite2D = Sprite2D.new()
	#	var glasses_sprite: Sprite2D = Sprite2D.new()
	#	var scarf_sprite: Sprite2D = Sprite2D.new()
	#	profile_sprite.texture = guest_profiles.pick_random()
	#	hat_sprite.texture = hat_accessories.pick_random()
	#	glasses_sprite.texture = glasses_accessories.pick_random()
	#	scarf_sprite.texture = scarf_accessories.pick_random()
	#	hat_sprite.position.y += hat_offset
	#	glasses_sprite.position.y += glasses_offset
	#	scarf_sprite.position.y += scarf_offset
	#	add_child(profile_sprite)
	#	add_child(hat_sprite)
	#	add_child(glasses_sprite)
	#	add_child(scarf_sprite)
	pass
