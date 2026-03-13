extends Area2D


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("drag"):
		print("_input %s" %  name)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("drag"):
		print("_unhandled_input %s" %  name)


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("drag"):
		print("_input_event %s" %  name)
