class_name GuestTrait
extends Resource

@export var is_neutral: bool = false
@export var trait_tags: Array[GuestTraitTag]
@export_multiline var text: String

func has_trait_for_property(property: DrinkProperty.PropertyType) -> bool:
	for my_tag: GuestTraitTag in trait_tags:
		if my_tag.affected_property == property:
			return true
	return false
	
func has_conflicting_tag(tag: GuestTraitTag) -> bool:
	for my_tag: GuestTraitTag in trait_tags:
		if my_tag.affected_property == tag.affected_property:
			if my_tag.is_negative != tag.is_negative:
				return true
	return false
