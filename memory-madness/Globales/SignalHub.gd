extends Node

signal on_level_selected(level_setting: LevelSettings)
signal on_exit_level
signal on_tile_selected(selectedTitle: MemoryTile)
signal on_game_over(move_made: int)

func on_emit_level_selected(level_setting: LevelSettings) -> void:
	on_level_selected.emit(level_setting)

func on_emit_exit_level() -> void:
	on_exit_level.emit()

func on_emit_tile_selected(tile: MemoryTile) -> void:
	on_tile_selected.emit(tile)
	
func on_emit_game_over(move_made: int) -> void:
	on_game_over.emit(move_made)
