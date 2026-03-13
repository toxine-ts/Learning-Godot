class_name LevelDataSelecter

func get_image_for_level_setting(level_setting: LevelSettings) -> Array[Texture2D]:
	ImageManager.shuffle_imgages()
	var selected_image: Array[Texture2D] = []
	for index in level_setting.target_paires:
		selected_image.append(ImageManager.get_image_by_index(index))
		selected_image.append(ImageManager.get_image_by_index(index))
	selected_image.shuffle()
	return selected_image
