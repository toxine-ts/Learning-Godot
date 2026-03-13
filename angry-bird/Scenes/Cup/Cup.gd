class_name Cup

extends StaticBody2D

const CUP_GROUP: String = "Cup"

func _enter_tree() -> void:
	add_to_group(CUP_GROUP)

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func die() -> void:
	animation_player.play("Visuals")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Visuals":
		SignalHub.on_emit_cup_destroyed()
		queue_free()
		
