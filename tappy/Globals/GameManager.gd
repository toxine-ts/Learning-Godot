extends Node

const GAME = preload("uid://ojsvie51nj4j")
const MAIN = preload("uid://bk7wx4bliuk8n")
const SIMPLE_CHANGE = preload("uid://dy6j7mtrvkkye")
const COMPLEX_CHANGE = preload("uid://cbo88gpvhonrl")

var complex_change: ComplexChange
var next_scene: PackedScene

func _ready() -> void:
	complex_change = COMPLEX_CHANGE.instantiate()
	add_child(complex_change)

func load_next_scene() -> void:
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)

func start_transition(new_scene: PackedScene) -> void:
	next_scene = new_scene
	complex_change.play_fade()

func load_game_scene() -> void:
	start_transition(GAME)
	#next_scene = GAME
	#get_tree().change_scene_to_packed(SIMPLE_CHANGE)
	
	
func load_main_scene() -> void:
	start_transition(MAIN)
	#next_scene = MAIN
	#get_tree().change_scene_to_packed(SIMPLE_CHANGE)
