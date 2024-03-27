class_name FlavourParticle
extends RigidBody2D

var represented_flavour: DrinkProperty.PropertyType

var flavour_colours = {
	DrinkProperty.PropertyType.ASTRINGENCY: Color.WEB_MAROON,
	DrinkProperty.PropertyType.SWEETNESS: Color.PAPAYA_WHIP,
	DrinkProperty.PropertyType.FLORALITY: Color.MEDIUM_ORCHID,
	DrinkProperty.PropertyType.SPICE: Color.DARK_RED,
	DrinkProperty.PropertyType.NUTTINESS: Color.SIENNA
}
