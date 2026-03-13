class_name LevelScoreResource

extends Resource


const DEFAULT_SCORE: int = 999

@export var level_score: Dictionary[int, int]

func get_level_best(level: int) -> int:
	return level_score.get(level, DEFAULT_SCORE)


func try_update_best_score(level: int, new_score: int) -> void:
	if get_level_best(level) > new_score:
		level_score[level] = new_score
