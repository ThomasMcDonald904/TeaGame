extends Control

@onready var popup_menu: PopupMenu = $PopupMenu
@onready var added_ingredient_v_box = $PanelContainer/HBoxContainer/IngredientsInBrewPanel/VBoxContainer/ScrollContainer/AddedIngredientVBox

var ingredient_dir = DirAccess.open("res://ingredients/")
var available_ingredients: Array[Ingredient]
var added_ingredients: Array[Ingredient]
var brew_temperature: float = 0.0
var drink_property: DrinkProperties = DrinkProperties.new()

var brew: Brew = Brew.new()

var ingredient_list_item_PS: PackedScene = preload("res://scenes/Gyms/brewing/ingredient_list_item.tscn")

var sim_timestep: float = 1.0
var sim_paused: bool = true

@export var AstringencyDelta: DEBUG_DrinkPropertyDelta
@export var SweetnessDelta: DEBUG_DrinkPropertyDelta
@export var FloralityDelta: DEBUG_DrinkPropertyDelta
@export var SpicednessDelta: DEBUG_DrinkPropertyDelta
@export var NuttynessDelta: DEBUG_DrinkPropertyDelta

var elapsed_time: float = 0.0
@export_category("Time Labels")
@export var elapsed_time_label: Label
@export_category("Drink Labels")
@export var astringency_value: Label
@export var sweetness_value: Label
@export var florality_value: Label
@export var spicedness_value: Label
@export var nuttyness_value: Label
@export_category("Sim Labels")
@export var play_state: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	refresh_drink_value_display()
	
	if ingredient_dir:
		ingredient_dir.list_dir_begin()
		var file_name = ingredient_dir.get_next()
		while file_name != "":
			if ingredient_dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				var filepath: String = ingredient_dir.get_current_dir() +"/" + file_name
				var ingredient: Ingredient = load(filepath) as Ingredient
				available_ingredients.append(ingredient)
				popup_menu.add_item(ingredient.name)
			file_name = ingredient_dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !sim_paused:
		brew.tick(delta)
		elapsed_time += delta
		elapsed_time_label.text = "Elapsed time: %03.1fs"%elapsed_time
		refresh_drink_value_display()


func _on_popup_menu_index_pressed(index):
	#popup_menu.hide()
	if index == 0:
		popup_menu.hide()
		return
	index -= 1
	brew.ingredients.append(available_ingredients[index])
	added_ingredients.append(available_ingredients[index])
	var list_item: DEBUG_IngredientListItem = ingredient_list_item_PS.instantiate()
	list_item.set_ingredient(available_ingredients[index])
	added_ingredient_v_box.add_child(list_item)
	list_item.connect("remove_ingredient", _on_remove_ingredient)
	refresh_property_deltas()
	print("Added %s to the brew." % available_ingredients[index].name)


func _on_add_ingredient_button_pressed():
	if !popup_menu.visible:
		popup_menu.show()
	
func _on_remove_ingredient(item_idx: int):
	print("%s removed from the brew." % added_ingredients[item_idx].name)
	brew.ingredients.remove_at(item_idx)
	added_ingredients.remove_at(item_idx)
	added_ingredient_v_box.get_child(item_idx).queue_free()
	refresh_property_deltas()


func _on_step_sim_button_pressed():
	set_sim_paused(true)
	elapsed_time += 1.0
	elapsed_time_label.text = "Elapsed time: %03.1fs"%elapsed_time
	brew.tick(1.0)
	refresh_drink_value_display()

func refresh_drink_value_display():
	astringency_value.text = 	"Astringency   %5.2f"%brew.drink_property.astringency.value
	sweetness_value.text = 		"Sweetness     %5.2f"%brew.drink_property.sweetness.value
	florality_value.text = 		"Florality     %5.2f"%brew.drink_property.florality.value
	spicedness_value.text = 	"Spicedness    %5.2f"%brew.drink_property.spicedness.value
	nuttyness_value.text = 		"Nuttyness     %5.2f"%brew.drink_property.nuttyness.value

func refresh_property_deltas():
	AstringencyDelta.participating_ingredient_names.clear()
	AstringencyDelta.participating_ingredient_prop_changes.clear()
	SweetnessDelta.participating_ingredient_names.clear()
	SweetnessDelta.participating_ingredient_prop_changes.clear()
	FloralityDelta.participating_ingredient_names.clear()
	FloralityDelta.participating_ingredient_prop_changes.clear()
	SpicednessDelta.participating_ingredient_names.clear()
	SpicednessDelta.participating_ingredient_prop_changes.clear()
	NuttynessDelta.participating_ingredient_names.clear()
	NuttynessDelta.participating_ingredient_prop_changes.clear()
	
	for ingredient in added_ingredients:
		var propertyDeltas: DrinkProperties = ingredient.get_drink_property_changes(brew.drink_property.temperature.value)
		
		if propertyDeltas.astringency.value > 0.0:
			AstringencyDelta.participating_ingredient_names.append(ingredient.name)
			AstringencyDelta.participating_ingredient_prop_changes.append(propertyDeltas.astringency.value)
		
		if propertyDeltas.sweetness.value > 0.0:
			SweetnessDelta.participating_ingredient_names.append(ingredient.name)
			SweetnessDelta.participating_ingredient_prop_changes.append(propertyDeltas.sweetness.value)
		
		if propertyDeltas.florality.value > 0.0:
			FloralityDelta.participating_ingredient_names.append(ingredient.name)
			FloralityDelta.participating_ingredient_prop_changes.append(propertyDeltas.florality.value)
		
		if propertyDeltas.spicedness.value > 0.0:
			SpicednessDelta.participating_ingredient_names.append(ingredient.name)
			SpicednessDelta.participating_ingredient_prop_changes.append(propertyDeltas.spicedness.value)
			
		if propertyDeltas.nuttyness.value > 0.0:
			NuttynessDelta.participating_ingredient_names.append(ingredient.name)
			NuttynessDelta.participating_ingredient_prop_changes.append(propertyDeltas.nuttyness.value)
	
	AstringencyDelta.refresh()
	SweetnessDelta.refresh()
	FloralityDelta.refresh()
	SpicednessDelta.refresh()
	NuttynessDelta.refresh()


func _on_temperature_spin_box_value_changed(value):
	brew.drink_property.temperature.value = value
	refresh_property_deltas()


func _on_timestep_spin_box_value_changed(value):
	set_sim_paused(true)
	sim_timestep = value


func _on_play_button_pressed():
	set_sim_paused(false)


func _on_pause_button_pressed():
	set_sim_paused(true)


func _on_steeper_raise_pressed():
	pass # Replace with function body.


func _on_reset_brew_button_pressed():
	set_sim_paused(true)
	var temp = brew.drink_property.temperature.value
	brew = Brew.new()
	for ingredient in added_ingredients:
		brew.ingredients.append(ingredient)
	brew.drink_property.temperature.value = temp
	elapsed_time = 0.0
	elapsed_time_label.text = "Elapsed time: %03.1fs"%elapsed_time
	refresh_drink_value_display()
	
func set_sim_paused(paused: bool):
	sim_paused = paused
	play_state.text = "⏸" if sim_paused else "▶"
