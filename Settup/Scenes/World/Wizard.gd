class_name Wizard
extends Node2D

@onready var reveal_time: Timer = $RevealTime

signal cast_spell
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_reveal_timer_timeout() -> void:
	show() # Replace with function body.


func _on_cast_spell_timeout() -> void:
	cast_spell.emit()# Replace with function body.
