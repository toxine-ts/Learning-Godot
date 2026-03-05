extends CanvasLayer

class_name ComplexChange

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func play_fade() -> void:
	animation_player.play("fade")

func switch_scene() -> void:
	GameManager.load_next_scene()
