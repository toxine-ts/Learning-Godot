extends Node2D

const TETRIS = preload("uid://rxwcie4b6wbb")

const DICE = preload("uid://cnnq8824yg5bk")
@onready var dice_spawn_timer: Timer = $Pausable/DiceSpawnTimer
@onready var scrore_label: Label = $ScroreLabel
@onready var music: AudioStreamPlayer = $music
@onready var pausable: Node = $Pausable

const GAME_OVER = preload("uid://c0orcx0ncovyq")
const MARGIN: float = 80.0
const STOPPABLE_GROUP_KEY: String = "stoppable"
var points: int = 0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()

func _ready() -> void:
	get_tree().paused = false
	music.stream = TETRIS
	music.play()
	score_points()
	spawn_dice()

func spawn_dice() -> void:
	var new_dice: Dice = DICE.instantiate()
	var view_port: Rect2 = get_viewport_rect()
	var dice_x_position = randf_range(
		view_port.position.x + MARGIN,
		view_port.end.x + MARGIN
	)
	new_dice.position = Vector2(dice_x_position , -MARGIN)
	pausable.add_child(new_dice)
	new_dice.game_over.connect(_on_dice_game_over)

# ca va arreter la phisique de toutes les node du groupe
#func pause_all() -> void:
	#dice_spawn_timer.stop()
	#var to_stop: Array[Node] = get_tree().get_nodes_in_group(STOPPABLE_GROUP_KEY)
	#for item in to_stop:
		#item.set_physics_process(false)

func _on_dice_spawn_timer_timeout() -> void:
	spawn_dice() # Replace with function body.

func _on_dice_game_over() -> void:
	#pause_all()
	music.stop()
	music.stream = GAME_OVER
	music.play()
	get_tree().paused = true # va arreter toutes les nodes donc plus de musics etc... 

func score_points() -> void:
	scrore_label.text = str(points).pad_zeros(4)

func _on_fox_point_scored() -> void:
	points += 1
	scrore_label.text = str(points).pad_zeros(4)
