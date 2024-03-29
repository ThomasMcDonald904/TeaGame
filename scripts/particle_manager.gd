extends Node2D

var FLAVOUR_PARTICLE_PS: PackedScene = preload("res://scenes/flavour_particle.tscn")

@onready var drink_contents: DrinkContents = DrinkContents.new()

# Vector represents starting and ending angle of the graph
@onready var flavour_graphs = {
	DrinkProperty.PropertyType.ASTRINGENCY: [$GraphAstringency, Vector2(0, 0), $AstringencyLabel],
	DrinkProperty.PropertyType.SWEETNESS: [$GraphSweetness, Vector2(0, 0), $SweetnessLabel],
	DrinkProperty.PropertyType.FLORALITY: [$GraphFlorality, Vector2(0, 0), $FloralityLabel],
	DrinkProperty.PropertyType.SPICE: [$GraphSpice, Vector2(0, 0), $SpiceLabel],
	DrinkProperty.PropertyType.NUTTINESS: [$GraphNuttiness, Vector2(0, 0), $NuttinessLabel]
}
var currently_highlighted_graph

var spawn_radius = 30

func spawn_particles(wanted_global_position: Vector2, number_of_particles_to_emit: int, flavour: DrinkProperty.PropertyType):
	for i in range(number_of_particles_to_emit):
		var instance: RigidBody2D = FLAVOUR_PARTICLE_PS.instantiate()
		instance.represented_flavour = flavour
		instance.modulate = instance.flavour_colours[flavour]
		instance.name = DrinkProperty.PropertyType.keys()[flavour] + "FlavorParticle" + str(randi() % 500)
		add_child(instance)
		instance.global_position.x = wanted_global_position.x + spawn_radius * cos(deg_to_rad(randi() % 360))
		instance.global_position.y = wanted_global_position.y + spawn_radius * sin(deg_to_rad(randi() % 360))

func divide_flavour_graph():
	var previous_angle: float = 0.0
	if drink_contents.get_total_number_of_particles() == 1:
		for flavour in drink_contents.flavour_particle_quantity.keys():
			var fill_angle = 360 * drink_contents.flavour_particle_quantity[flavour]
			flavour_graphs[flavour][0].radial_initial_angle = 0
			flavour_graphs[flavour][0].radial_fill_degrees = fill_angle
			flavour_graphs[flavour][1] = Vector2(0, fill_angle)
	else: 
		var angle_per_particle: float = 360.0 / drink_contents.get_total_number_of_particles()
		for flavour in drink_contents.flavour_particle_quantity.keys():
			var fill_angle = angle_per_particle * drink_contents.flavour_particle_quantity[flavour]
			var initial_angle_tweener = get_tree().create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			var fill_degrees_tweener = get_tree().create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			initial_angle_tweener.tween_property(flavour_graphs[flavour][0], "radial_initial_angle", previous_angle, 0.7)
			fill_degrees_tweener.tween_property(flavour_graphs[flavour][0], "radial_fill_degrees", fill_angle, 0.7)
			flavour_graphs[flavour][1] = Vector2(previous_angle, fill_angle + previous_angle)
			previous_angle += fill_angle


func _on_area_2d_body_entered(flavour_particle: FlavourParticle):
	drink_contents.flavour_particle_quantity[flavour_particle.represented_flavour] += 1
	divide_flavour_graph()
	flavour_particle.queue_free()


func _on_area_2d_mouse_entered():
	# This chunk of math which is surprisingly hard to do gives the angle between 
	# the mouse cursor and the positive y axis
	var angle_rad = atan2(-(get_window().get_mouse_position().x - position.x), -(get_window().get_mouse_position().y - position.y))
	var angle_degrees = 360 - (rad_to_deg(angle_rad) + 360 if angle_rad < 0 else rad_to_deg(angle_rad))
	for graph in flavour_graphs.values():
		if angle_degrees >= graph[1].x and angle_degrees < graph[1].y:
			maximize_graph(graph)


func _on_area_2d_mouse_exited():
	for graph in flavour_graphs.values():
			minimize_graph(graph)

func minimize_graph(graph):
	var tweener1 = get_tree().create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	tweener1.tween_property(graph[0], "scale", Vector2(1, 1), 0.2)
	var label: TextureRect = graph[2]
	label.hide()

func maximize_graph(graph):
	var tweener1 = get_tree().create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	tweener1.tween_property(graph[0], "scale", Vector2(1.1, 1.1), 0.2)
	var label: TextureRect = graph[2]
	var label_orbit_radius = 200
	var angle = (graph[1].x + graph[1].y)/2
	label.position.x = label_orbit_radius * cos((angle-90) * PI/180) - label.size.x/2
	label.position.y = label_orbit_radius * sin((angle-90) * PI/180) - label.size.y/2
	label.show()
	currently_highlighted_graph = graph

func _on_area_2d_input_event(viewport, event: InputEvent, shape_idx):
	# This chunk of math which is surprisingly hard to do gives the angle between 
	# the mouse cursor and the positive y axis
	var angle_rad = atan2(-(get_window().get_mouse_position().x - position.x), -(get_window().get_mouse_position().y - position.y))
	var angle_degrees = 360 - (rad_to_deg(angle_rad) + 360 if angle_rad < 0 else rad_to_deg(angle_rad))
	for graph in flavour_graphs.values():
		if angle_degrees >= graph[1].x and angle_degrees < graph[1].y:
			if graph != currently_highlighted_graph:
				minimize_graph(currently_highlighted_graph)
				maximize_graph(graph)

