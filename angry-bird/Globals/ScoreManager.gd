extends Node

const SCORE_PATH = "user://animals_score.res"


var level_selected: int = 1:
	get: return level_selected
	set(value): level_selected = value
	
var _level_score: LevelScoreResource = LevelScoreResource.new()

func _ready() -> void:
	load_score_from_fiel()


func get_level_best(level: int) -> int:
	return _level_score.get_level_best(level)


func set_score_for_current_level(score: int) -> void:
	_level_score.try_update_best_score(level_selected, score)
	save_score_to_fiel()
	

func load_score_from_fiel() -> void:
	if ResourceLoader.exists(SCORE_PATH):
		_level_score = load(SCORE_PATH)

func save_score_to_fiel() -> void:
	ResourceSaver.save(_level_score, SCORE_PATH)
