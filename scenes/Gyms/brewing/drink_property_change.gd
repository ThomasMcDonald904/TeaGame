@tool
class_name DEBUG_DrinkPropertyDelta
extends HBoxContainer

@export var property_type: DrinkProperty.PropertyType = DrinkProperty.PropertyType.NONE
@export var participating_ingredient_names: Array[String]
@export var participating_ingredient_prop_changes: Array[float]
var property_change: float = 0.0

@onready var participating_ingredients_panel = $PropertyDelta/ParticipatingIngredientsPanel
@onready var participating_ingredients_vbox = $PropertyDelta/ParticipatingIngredientsPanel/ParticipatingIngredients
@onready var property_delta = $PropertyDelta

# Called when the node enters the scene tree for the first time.
func _ready():
	$PropertyName.text = DrinkProperty.PropertyType.keys()[property_type]
	if not Engine.is_editor_hint():
		refresh()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func refresh():
	property_change = 0.0
	for change in participating_ingredient_prop_changes:
		property_change += change
	property_delta.text = "%5.2f/s"%property_change
	
func populate_participant_vbox():
	for idx in participating_ingredient_names.size():
		var label = Label.new()
		label.text = "%s %5.2f"%[participating_ingredient_names[idx],participating_ingredient_prop_changes[idx]]
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		participating_ingredients_vbox.add_child(label)
	participating_ingredients_panel.show()

func clear_participant_vbox():
	participating_ingredients_panel.hide()
	for child in participating_ingredients_vbox.get_children():
		child.queue_free()

func _on_property_delta_mouse_entered():
	populate_participant_vbox()


func _on_property_delta_mouse_exited():
	clear_participant_vbox()
