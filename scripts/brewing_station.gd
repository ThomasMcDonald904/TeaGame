extends Node2D

signal brew_changed()
signal steeper_lowered()
signal steeper_raised()
signal serve_brew(brew: Brew)

var is_dragging_steeper: bool = false
var drag_start_y: int = 0
@export_category("Steeping")
@export var steeper_path_follow: PathFollow2D
@export var ratio_when_ingredients_added: float = 0.9
@export var debug_drink_properties_display: DrinkPropertiesDisplay

var is_brew_served: bool = false
var is_steeper_lowered: bool = false
var burner_value: float = 0
var ingredients_in_steeper: Array[Ingredient] = []
var brew: Brew = Brew.new()

var is_serve_brew_confirmation_shown: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	debug_drink_properties_display.drink_properties = brew.drink_property
	debug_drink_properties_display.refresh_values()
	Globals.steeper_ingredients_changed.connect(fill_ingredients_in_steeper)
	fill_ingredients_in_steeper()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_steeper_lowered && !is_brew_served:
		brew.tick(delta)
		brew_changed.emit()

func fill_ingredients_in_steeper():
	ingredients_in_steeper.clear()
	for ingredient in Globals.steeper_ingredients:
		ingredients_in_steeper.append(ingredient)

func _on_steeper_area_2d_input_event(_viewport, event: InputEvent, _shape_idx):
	if event is InputEventMouseButton:
		if (event as InputEventMouseButton).pressed && !is_dragging_steeper:
			drag_start_y = get_viewport().get_mouse_position().y
			is_dragging_steeper = true
		elif is_dragging_steeper && !(event as InputEventMouseButton).pressed:
			is_dragging_steeper = false

func _input(event: InputEvent):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
		if is_dragging_steeper && !(event as InputEventMouseButton).pressed:
			is_dragging_steeper = false
	elif event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.relative)
		if is_dragging_steeper:
			steeper_path_follow.progress_ratio = clamp(event.relative.y/100.0 + steeper_path_follow.progress_ratio, 0, 1)
			if steeper_path_follow.progress_ratio >= ratio_when_ingredients_added:
				on_steeper_lowered()
			elif steeper_path_follow.progress_ratio < ratio_when_ingredients_added:
				on_steeper_raised()

func on_steeper_lowered():
	is_steeper_lowered = true
	for ingredient in ingredients_in_steeper:
		brew.ingredients.append(ingredient)
		brew_changed.emit()
	steeper_lowered.emit()

func on_steeper_raised():
	is_steeper_lowered = false
	brew.ingredients.clear()
	brew_changed.emit()
	steeper_raised.emit()
	
func _on_burner_value_changed(value):
	burner_value = value
	brew.drink_property.temperature.value = burner_value
	brew_changed.emit()


func _on_debug_display_toggled(toggled_on):
	debug_drink_properties_display.visible = toggled_on


func _on_confirm_button_pressed():
	$Control/ServeBrewQuestionPanel.visible = false
	is_brew_served = true
	serve_brew.emit(brew)


func _on_refuse_button_pressed():
	$Control/ServeBrewQuestionPanel.visible = false
	$Control/PotButton.visible = true


func _on_pot_button_pressed():
	$Control/PotButton.visible = false
	if !$Control/ServeBrewQuestionPanel.visible && !is_brew_served:
		$Control/ServeBrewQuestionPanel.visible = true
