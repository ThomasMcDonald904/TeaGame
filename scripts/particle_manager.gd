extends Node

var FLAVOUR_PARTICLE_PS: PackedScene = preload("res://scenes/flavour_particle.tscn")


func spawn_particles(global_position: Vector2, number_of_particles_to_emit: int, flavour: DrinkProperty.PropertyType):
	for i in range(number_of_particles_to_emit):
		var instance: Area2D = FLAVOUR_PARTICLE_PS.instantiate()
		instance.represented_flavour = flavour
		instance.modulate = instance.flavour_colours[flavour]
		instance.global_position = global_position
