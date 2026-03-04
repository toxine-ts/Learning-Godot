extends Node

@onready var pipe_holder: Node = $PipeHolder
@onready var uppder_spawn: Marker2D = $UppderSpawn
@onready var lowwer_spawn: Marker2D = $LowwerSpawn
const PIPES = preload("uid://de413bdpqj35r")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	spawn_pipe()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_pipe() -> void:
	var new_pipe: Pipes = PIPES.instantiate()
	var pipes_y_position: = randf_range(
		uppder_spawn.position.y,
		lowwer_spawn.position.y
	)
	new_pipe.position = Vector2(uppder_spawn.position.x, pipes_y_position)
	pipe_holder.add_child(new_pipe)

func _on_spawn_timer_timeout() -> void:
	spawn_pipe()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		GameManager.load_main_scene()

	
