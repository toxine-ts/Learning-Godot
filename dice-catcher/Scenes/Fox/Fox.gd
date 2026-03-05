extends Area2D

class_name Fox

@export var SPEED: float = 200.0

signal point_scored

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sounds: AudioStreamPlayer2D = $Sounds

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#var move: float = 0.0
	#if Input.is_action_pressed("ui_left"):
		#move -= SPEED
	#elif Input.is_action_pressed("ui_right"):
		#move += SPEED
	var move: float = Input.get_axis("ui_left", "ui_right") # return 1.0 ou -1.0
	
	if !is_zero_approx(move):
		sprite_2d.flip_h = move > 0.0
	
	position.x += move * delta * SPEED # multiply par speed pour bouger sur les x negative ou positive


func _on_area_entered(area: Area2D) -> void:
	if area is Dice:
		sounds.play()
		area.queue_free()
		point_scored.emit()
