extends ColorRect


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("drag"):
		print("_input %s" %  name)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("drag"):
		print("_unhandled_input %s" %  name)
		#if name == "Green":
			#get_viewport().set_input_as_handled()


func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("drag"):
		print("_gui_input %s" %  name)
