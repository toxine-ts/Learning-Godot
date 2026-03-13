class_name Scorer

extends Node

@onready var reveal_timer: Timer = $RevealTimer


static var is_selection_enable: bool = true

var _selected_tile: Array[MemoryTile]
var _pair_made: int = 0
var _target_pair: int = 0
var _move_made: int = 0


func get_pair_str() -> String:
	return "%d / %d" % [_pair_made,_target_pair]

func get_move_made_str() -> String:
	return "%d" % [_move_made]

func clear_new_game(level_setting: LevelSettings) -> void:
	_selected_tile.clear()
	is_selection_enable = true
	_pair_made = 0
	_target_pair = 0
	_move_made = 0
	_target_pair = level_setting.target_paires

func _ready() -> void:
	SignalHub.on_tile_selected.connect(on_tile_selected)
	SignalHub.on_exit_level.connect(on_game_exit_press)

func check_for_pair() -> void: 
	_move_made += 1
	
	if _selected_tile[0].match_other_tiles(_selected_tile[1]):
		_selected_tile[0].kill_pair()
		_selected_tile[1].kill_pair()
		_pair_made += 1
		
func handle_kill_pair() -> void:
	_selected_tile[0].kill_pair()
	_selected_tile[1].kill_pair()
		

func process_paire() -> void:
	if _selected_tile.size() != 2: return
	is_selection_enable = false
	reveal_timer.start()
	check_for_pair()

func on_tile_selected(tile: MemoryTile) -> void:
	if !is_selection_enable: return
	if tile in _selected_tile: return
	_selected_tile.append(tile)
	process_paire()


func _on_reveal_timer_timeout() -> void:
	for tile in _selected_tile:
		tile.reveal(false)
	is_selection_enable = true
	_selected_tile.clear()
	
func on_game_exit_press() -> void:
	reveal_timer.stop()
	_selected_tile.clear()
	is_selection_enable = true
	
