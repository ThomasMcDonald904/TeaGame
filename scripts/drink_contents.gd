class_name DrinkContents

var flavour_particle_quantity = {
	DrinkProperty.PropertyType.ASTRINGENCY: 0,
	DrinkProperty.PropertyType.SWEETNESS: 0,
	DrinkProperty.PropertyType.FLORALITY: 0,
	DrinkProperty.PropertyType.SPICEDNESS: 0,
	DrinkProperty.PropertyType.NUTTYNESS: 0
}

func get_total_number_of_particles():
	var i = 0
	for value in flavour_particle_quantity.values():
		i += value
	return i

func _init(_astringency_particles: int = 0, _florality_particles: int = 0, _nuttyness_particles: int = 0, _spicedness_particles: int = 0, _sweetness_particles: int = 0):
	flavour_particle_quantity[DrinkProperty.PropertyType.ASTRINGENCY] = _astringency_particles
	flavour_particle_quantity[DrinkProperty.PropertyType.SWEETNESS] = _sweetness_particles
	flavour_particle_quantity[DrinkProperty.PropertyType.FLORALITY] = _florality_particles
	flavour_particle_quantity[DrinkProperty.PropertyType.SPICEDNESS] = _spicedness_particles
	flavour_particle_quantity[DrinkProperty.PropertyType.NUTTYNESS] = _nuttyness_particles
