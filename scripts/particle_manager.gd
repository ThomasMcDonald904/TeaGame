extends Node

var FLAVOUR_PARTICLE_PS: PackedScene = preload("res://scenes/flavour_particle.tscn")

@onready var drink_contents: DrinkContents = DrinkContents.new()

@onready var flavour_graphs = {
	DrinkProperty.PropertyType.ASTRINGENCY: $GraphAstringency,
	DrinkProperty.PropertyType.SWEETNESS: $GraphSweetness,
	DrinkProperty.PropertyType.FLORALITY: $GraphFlorality,
	DrinkProperty.PropertyType.SPICEDNESS: $GraphSpicedness,
	DrinkProperty.PropertyType.NUTTYNESS: $GraphNuttyness
}

func spawn_particles(wanted_global_position: Vector2, number_of_particles_to_emit: int, flavour: DrinkProperty.PropertyType):
	for i in range(number_of_particles_to_emit):
		var instance: RigidBody2D = FLAVOUR_PARTICLE_PS.instantiate()
		instance.represented_flavour = flavour
		instance.modulate = instance.flavour_colours[flavour]
		instance.name = DrinkProperty.PropertyType.keys()[flavour] + "FlavorParticle" + str(randi() % 500)
		add_child(instance)
		instance.global_position = wanted_global_position

func divide_flavour_graph():
	var previous_angle: float = 0.0
	if drink_contents.get_total_number_of_particles() == 1:
		for flavour in drink_contents.flavour_particle_quantity.keys():
			var fill_angle = 360 * drink_contents.flavour_particle_quantity[flavour]
			flavour_graphs[flavour].radial_initial_angle = 0
			flavour_graphs[flavour].radial_fill_degrees = fill_angle
			
			
	else: 
		var angle_per_particle: float = 360.0 / drink_contents.get_total_number_of_particles()
		for flavour in drink_contents.flavour_particle_quantity.keys():
			var fill_angle = angle_per_particle * drink_contents.flavour_particle_quantity[flavour]
			var initial_angle_tweener = get_tree().create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			var fill_degrees_tweener = get_tree().create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			initial_angle_tweener.tween_property(flavour_graphs[flavour], "radial_initial_angle", previous_angle, 0.7)
			fill_degrees_tweener.tween_property(flavour_graphs[flavour], "radial_fill_degrees", fill_angle, 0.7)
			previous_angle += fill_angle


func _on_area_2d_body_entered(flavour_particle: FlavourParticle):
	drink_contents.flavour_particle_quantity[flavour_particle.represented_flavour] += 1
	divide_flavour_graph()
	flavour_particle.queue_free()
