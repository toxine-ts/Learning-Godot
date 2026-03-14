extends Node

@export var main_menu_music: AudioStream
@export var game_music: AudioStream
@export var click_effect: AudioStream
@export var tile_effect: AudioStream
@export var game_over_effect: AudioStream

@onready var effects: AudioStreamPlayer = $Effects
@onready var music: AudioStreamPlayer = $Music


func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_exit_level.connect(on_exit_level)
	SignalHub.on_tile_selected.connect(on_tile_selected)
	SignalHub.on_game_over.connect(on_game_over)
	on_exit_level()

func play_music(stream: AudioStream) -> void:
	music.stream = stream
	music.play()

func play_effect(stream: AudioStream) -> void:
	effects.stream = stream
	effects.play()

func on_exit_level() -> void:
	play_music(main_menu_music)
	
func on_tile_selected(_selectedTitle: MemoryTile) -> void:
	play_effect(tile_effect)
	
func on_game_over(_move_made: int) -> void:
	play_effect(game_over_effect)
	
func on_level_selected(_level_setting: LevelSettings) -> void:
	play_effect(game_music)
	play_music(click_effect)
