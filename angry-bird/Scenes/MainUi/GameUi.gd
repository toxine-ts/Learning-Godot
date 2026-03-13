extends Control

const MAIN = preload("uid://b0ipkaseg3tys")

@onready var vb_complete: VBoxContainer = $MarginContainer/VBComplete
@onready var complete_sound: AudioStreamPlayer = $CompleteSound
@onready var attempt_count_label: Label = $MarginContainer/VBoxContainer/HBoxContainer2/AttemptCountLabel
@onready var level_label: Label = $MarginContainer/VBoxContainer/HBLevel/LevelLabel

var _total_cups: int = 0
var _current_cups: int = 0
var _attempts_count: int = -1

func _ready() -> void:
	get_tree().paused = false
	SignalHub.on_cup_destroyed.connect(handle_on_cup_destroyed)
	SignalHub.on_attempt_made.connect(handle_attempts_counts)
	_total_cups = get_tree().get_nodes_in_group(Cup.CUP_GROUP).size()
	handle_attempts_counts()
	level_label.text = "%d" % ScoreManager.level_selected
	


func handle_attempts_counts() -> void:
	_attempts_count += 1
	attempt_count_label.text = "%d" % _attempts_count

func handle_on_cup_destroyed() -> void:
	_current_cups += 1
	if _total_cups == _current_cups:
		vb_complete.show()
		complete_sound.play()
		ScoreManager.set_score_for_current_level(_attempts_count)
		get_tree().paused = true
	
func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("backToMain"):
		get_tree().change_scene_to_packed(MAIN)
	elif event.is_action_pressed("restart_game") and _total_cups == _current_cups:
		get_tree().change_scene_to_packed(MAIN)
		
