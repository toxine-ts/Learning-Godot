extends CharacterBody2D

class_name Tappy

#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#signal on_plane_died
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")

var _jumped: bool = false
const JUMP_POWER: float = -350.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		animation_player.play("thurst")
		_jumped = true		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()
	
	if is_on_floor():
		die()


func fly(delta: float) -> void:
	velocity.y += _gravity * delta
	if _jumped:
		velocity.y = JUMP_POWER
		_jumped = false

func die() -> void:
	get_tree().paused = true
	SignalsHub.emi_on_plane_died()
	#animated_sprite_2d.stop()
	#set_physics_process(false)
