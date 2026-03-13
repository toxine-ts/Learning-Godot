extends Control

@onready var main: Control = $Main
@onready var game: Control = $Game


func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_exit_level.connect(on_exit_level)
	
func handle_show_game(isShow: bool) -> void:
	game.visible = isShow
	main.visible = !isShow
	
func on_level_selected(_level_setting: LevelSettings) -> void:
	handle_show_game(true)

func on_exit_level() -> void:
		handle_show_game(false)
