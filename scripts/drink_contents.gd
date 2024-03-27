class_name DrinkContents

var flavour_particle_quantity = {
	DrinkProperty.PropertyType.ASTRINGENCY: 0,
	DrinkProperty.PropertyType.SWEETNESS: 0,
	DrinkProperty.PropertyType.FLORALITY: 0,
	DrinkProperty.PropertyType.SPICE: 0,
	DrinkProperty.PropertyType.NUTTINESS: 0
}

func get_total_number_of_particles():
	var i = 0
	for value in flavour_particle_quantity.values():
		i += value
	return i

func _init(_astringency_particles: int = 0, _florality_particles: int = 0, _nuttiness_particles: int = 0, _spice_particles: int = 0, _sweetness_particles: int = 0):
	flavour_particle_quantity[DrinkProperty.PropertyType.ASTRINGENCY] = _astringency_particles
	flavour_particle_quantity[DrinkProperty.PropertyType.SWEETNESS] = _sweetness_particles
	flavour_particle_quantity[DrinkProperty.PropertyType.FLORALITY] = _florality_particles
	flavour_particle_quantity[DrinkProperty.PropertyType.SPICE] = _spice_particles
	flavour_particle_quantity[DrinkProperty.PropertyType.NUTTINESS] = _nuttiness_particles
