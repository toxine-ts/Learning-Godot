class_name Hobbit
extends Node2D


func _init() -> void:
	print("%s _init %s" % [get_instance_id(), name])

func _enter_tree() -> void:
	print("%s _enter_tree %s" % [get_instance_id(), name])

func _exit_tree() -> void:
	print("%s _exit_tree %s" % [get_instance_id(), name])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("%s _ready %s" % [get_instance_id(), name]) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
