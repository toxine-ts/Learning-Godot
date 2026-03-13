class_name LevelSettings

extends Resource

@export var rows: int = 2
@export var col: int = 2


var total_tiles: int:
	get: return rows * col

var target_paires: int:
	get: return total_tiles / 2

func _to_string() -> String:
	return "%dx%d" % [rows, col]
