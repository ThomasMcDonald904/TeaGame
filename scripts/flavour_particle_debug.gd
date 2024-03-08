extends Node2D

var queue_counter = 0

func _ready():
	for item: Item in $Items.get_children():
		item.emit_particles.connect($ParticleManager.spawn_particles)

func _on_spawn_particles_button_up():
	for item: Item in $Items.get_children():
		# Normally the manager shouldn't call the particle's signal, 
		# it should call itself, ensuring decoupling
		item.emit_particles.emit(item.global_position, item.ingredient.flavor_queue[queue_counter].normal_flavor.value, item.ingredient.flavor_queue[queue_counter].normal_flavor.type)
		queue_counter += 1
