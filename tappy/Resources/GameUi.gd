extends Control

class_name GameUi
@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var game_over: AudioStreamPlayer = $GameOver
@onready var press_space_label: Label = $MarginContainer/PressSpaceLabel
@onready var show_reset: Timer = $ShowReset
@onready var score_label: Label = $MarginContainer/ScoreLabel

var score: int = 0

func _unhandled_input(event: InputEvent) -> void:
	if press_space_label.visible and event.is_action_pressed("power"):
		GameManager.load_main_scene()
		

func _ready() -> void:
	SignalsHub.on_plane_died.connect(on_plane_died_show_game_over)
	SignalsHub.on_point_scored.connect(on_point_scrored)

func on_plane_died_show_game_over()-> void:
	game_over_label.show()
	game_over.play()
	show_reset.start()
	ScoreManager.heigh_score = score


func _on_show_reset_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()

func on_point_scrored() -> void:
	score += 1
	score_label.text = str(score).pad_zeros(3)
