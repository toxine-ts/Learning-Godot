extends Node

const GAME = preload("uid://ojsvie51nj4j")
const MAIN = preload("uid://bk7wx4bliuk8n")

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)
	
	
func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)
