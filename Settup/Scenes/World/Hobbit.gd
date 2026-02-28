class_name Hobbit
extends Node2D

@export var timer_count: float = 2.0
@onready var reveal_timer: Timer = $RevealTimer

signal kill_wizard

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("hit_wizard"):
		kill_wizard.emit()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(PI * delta)

func hit_by_spell() -> void:
	scale = Vector2(0.2,0.2)
	set_process(false) 
