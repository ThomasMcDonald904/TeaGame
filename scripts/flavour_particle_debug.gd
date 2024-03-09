extends Node2D

var queue_counter = 0

func _ready():
	for item: Item in $Items.get_children():
		item.emit_particles.connect($ParticleManager.spawn_particles)

func _on_spawn_particles_button_up():
	for item: Item in $Items.get_children():
		# Normally the manager shouldn't call the particle's signal, 
		# it should call itself, ensuring decoupling
		var test = item.ingredient.flavor_queue
		if queue_counter <= item.ingredient.flavor_queue.size() - 1:
			item.emit_particles.emit(item.global_position, item.ingredient.flavor_queue[queue_counter].normal_flavor_intensity_value, item.ingredient.flavor_queue[queue_counter].normal_flavor)
	queue_counter += 1
