class_name Storyteller
extends RefCounted

var guest_trait_collection_PS = preload("res://drink_descriptives/test_descriptive_lib.tres")

func generate_story(guest_profile: GuestProfile):
	
	var guest_trait_collection: GuestTraitCollection = guest_trait_collection_PS
	var initial_trait: GuestTrait = guest_trait_collection.initial_descriptions.pick_random()
	var selected_traits: Array[GuestTrait]
	var traits_working_array: Array[GuestTrait] = guest_trait_collection.descriptions.duplicate()
	for i in 3:
		if traits_working_array.is_empty():
			break
		var selected_idx: int = randi_range(0, traits_working_array.size()-1)
		var selected: GuestTrait = traits_working_array.pop_at(selected_idx)
		for trait_tag in selected.trait_tags:
			traits_working_array = traits_working_array.filter(func(_trait: GuestTrait): return !_trait.has_conflicting_tag(trait_tag))
		selected_traits.append(selected)
		
	var story: String = initial_trait.text
	for selected_trait in selected_traits:
		story += selected_trait.text
		for trait_tag in selected_trait.trait_tags:
			var change = -1 if trait_tag.is_negative else 1
			if trait_tag.affected_property == DrinkProperty.PropertyType.TEMPERATURE:
				guest_profile.preference.temperature_preference.value += change
				guest_profile.preference.temperature_preference.lower_bound += change
				guest_profile.preference.temperature_preference.upper_bound += change
			elif trait_tag.affected_property == DrinkProperty.PropertyType.ASTRINGENCY:
				guest_profile.preference.astringency_preference.value += change
				guest_profile.preference.astringency_preference.lower_bound += change
				guest_profile.preference.astringency_preference.upper_bound += change
			elif trait_tag.affected_property == DrinkProperty.PropertyType.SWEETNESS:
				guest_profile.preference.sweetness_preference.value += change
				guest_profile.preference.sweetness_preference.lower_bound += change
				guest_profile.preference.sweetness_preference.upper_bound += change
			elif trait_tag.affected_property == DrinkProperty.PropertyType.FLORALITY:
				guest_profile.preference.florality_preference.value += change
				guest_profile.preference.florality_preference.lower_bound += change
				guest_profile.preference.florality_preference.upper_bound += change
			elif trait_tag.affected_property == DrinkProperty.PropertyType.SPICEDNESS:
				guest_profile.preference.spicedness_preference.value += change
				guest_profile.preference.spicedness_preference.lower_bound += change
				guest_profile.preference.spicedness_preference.upper_bound += change
			elif trait_tag.affected_property == DrinkProperty.PropertyType.NUTTYNESS:
				guest_profile.preference.nuttyness_preference.value += change
				guest_profile.preference.nuttyness_preference.lower_bound += change
				guest_profile.preference.nuttyness_preference.upper_bound += change
	
	guest_profile.story = story

