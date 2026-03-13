extends TextureRect


func _ready() -> void:
	get_random_image()
	run_tween()
	
func get_random_image() -> void:
	texture = ImageManager.get_random_tile_images()

func get_random_spin_time() -> float:
	return randf_range(1.0, 2.0)

func get_random_rotation() -> float:
	return deg_to_rad(randf_range(-360, 360))
	
func run_tween() -> void:
	var t := create_tween()
	t.tween_property(self, "scale", Vector2(0.5, 0.5), 0.5)
	t.tween_callback(get_random_image)
	t.tween_property(self, "scale", Vector2(1.1, 1.1), 0.5)
	t.parallel().tween_property(self, "rotation", get_random_rotation(), get_random_spin_time())
	t.tween_property(self, "scale", Vector2(1.0, 1.0), 0.5)
	t.tween_interval(0.05)
	t.tween_callback(run_tween)
	

	
