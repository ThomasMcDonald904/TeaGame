class_name Brewdio extends Node2D

signal goto_tea_room()
signal goto_office()

var fetchermann_interface_PS: PackedScene = preload("res://scenes/GUI/fetchermann_interface.tscn")
var fetchermann_yield_interface_PS: PackedScene = preload("res://scenes/GUI/fetchermann_yield_interface.tscn")
var fetchermann_PS: PackedScene = preload("res://scenes/fetchermann.tscn")

@export var steeper: OpenContainer


func _ready():
	if Market.fetchermann_day_sent == -1:
		var inst =  fetchermann_PS.instantiate()
		add_child(inst)
		$Fetchermann.fetchermann_clicked.connect(show_fetchermann_journal)
	$Window.window_clicked.connect(next_day)

func _exit_tree():
	pass
	#Globals.can_open_container = true

func next_day(nbr_days):
	$Control/VBoxContainer/GuestsArrivingTomorrow.visible = true if nbr_days == 1 else false
	$Control/VBoxContainer/Title.visible = false if nbr_days == 1 or nbr_days == 0 else true
	$Control/VBoxContainer/nbr_days.visible = false if nbr_days == 1 or nbr_days == 0 else true
	$Control/VBoxContainer/GuestsAreHere.visible = true if nbr_days == 0 else false
	$Control/AnimationPlayer.play("fade_to_night")
	$Control/VBoxContainer/nbr_days.text = "[center]" + str(nbr_days)

func increment_current_day():
	Globals.current_day += 1
	# Anything that must called when there is a new day
	GameState.letter_read = false
	GameState.guests_already_served = false

func set_nbr_days_text():
	$Control/VBoxContainer/nbr_days.text = "[wave amp=50][center]" + str(Globals.days_to_prepare*Globals.current_day%(Globals.days_to_prepare+1))

func populate_global_steeper_ingredients():
	Globals.steeper_ingredients.clear()
	for item in steeper.inventory:
		if (item as Item).ingredient != null:
			Globals.steeper_ingredients.append((item as Item).ingredient)
	Globals.steeper_ingredients_changed.emit()

func _on_service_tassle_tassle_pulled():
	goto_tea_room.emit()

func show_fetchermann_journal():
	var inst = fetchermann_interface_PS.instantiate()
	add_child(inst)
	inst.close_journal.connect($Fetchermann.leave)

func show_fetchermann_yield(collected_items: Array[Ingredient], total_cost: int):
	var inst = fetchermann_yield_interface_PS.instantiate()
	add_child(inst)
	inst.interface_dismissed.connect(set_held_items.bind(collected_items))
	inst.set_interface_text(collected_items, total_cost, Market.fetchermann_budget)

func set_held_items(collected_items: Array[Ingredient]):
	# TODO add more ingredient scenes
	var debug_add_items: Array[Ingredient] = []
	var item_dir: DirAccess = DirAccess.open("res://ingredients/scenes/")
	for scene_filename in item_dir.get_files():
		var filename: String = item_dir.get_current_dir() + "/" + scene_filename
		var item_PS: PackedScene = load(filename)
		var item: Item = item_PS.instantiate()
		if item.ingredient in collected_items:
			debug_add_items.append(item.ingredient)
			for i in collected_items.count(item.ingredient):
				Globals.held_fetchermann_items.append(item_PS.instantiate())
	var uncreated_ingredient_scenes = debug_array_diffence(collected_items, debug_add_items)
	for uncreated_ingredient in uncreated_ingredient_scenes:
		print(uncreated_ingredient.name + " tried to be held, but ingredient's scene isn't created.")
	

func arrive_fetchermann():
	if Market.fetchermann_day_sent != -1:
		if Globals.current_day - Market.fetchermann_day_sent == Market.fetchermann_market_time:
			var inst = fetchermann_PS.instantiate()
			add_child(inst)
			inst.arrive( )
			$Fetchermann.fetchermann_clicked.connect(show_fetchermann_journal)
			$Fetchermann.fetchermann_arrived.connect(show_fetchermann_yield)
			Market.fetchermann_day_sent = -1

func debug_array_diffence(arr1, arr2):
	var only_in_arr1 = []
	for v in arr1:
		if not (v in arr2):
			only_in_arr1.append(v)
	return only_in_arr1
