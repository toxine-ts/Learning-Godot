extends Control

@onready var score: Label = $MarginContainer/Score


func _ready() -> void:
	get_tree().paused = false
	score.text = "%03d" % ScoreManager.heigh_score


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		GameManager.load_game_scene()
