extends Node2D

signal tassle_pulled()

@export var end_segment:RigidBody2D
var segment_list: Array[RopeSegment] = []

func _ready():
	for i in range(35):
		var segment = RopeSegment.new(self)
		segment.rigidbody.position.y = i * 8
		segment_list.append(segment)
	for index in range(segment_list.size()-1):
		var joint = PinJoint2D.new()
		joint.softness = 0.1
		joint.node_a = segment_list[index].rigidbody.get_path()
		joint.node_b = segment_list[index + 1].rigidbody.get_path()
		add_child(joint)
	var joint = PinJoint2D.new()
	joint.node_a = $FirstSegment.get_path()
	joint.node_b = segment_list[0].rigidbody.get_path()
	add_child(joint)
	end_segment.position = segment_list[-1].rigidbody.position
	joint = PinJoint2D.new()
	joint.node_a = segment_list[-1].rigidbody.get_path()
	joint.node_b = end_segment.get_path()
	add_child(joint)

class RopeSegment extends Node:
	var sprite: Sprite2D 
	var rigidbody: RigidBody2D
	func _init(parent: Node):
		sprite = Sprite2D.new()
		sprite.texture = load("res://resources/textures/Tassle/tassle_rope_piece.png")
		rigidbody = RigidBody2D.new()
		rigidbody.mass = 0.5
		parent.add_child(rigidbody)
		rigidbody.add_child(sprite)

func _on_area_2d_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed("click"):
		$AnimationPlayer.play("tassle_pulled")
