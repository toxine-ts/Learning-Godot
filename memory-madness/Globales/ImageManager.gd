extends Node

const TILE_IMGAGES: TileImagesHolder = preload("uid://b0wolxlkqbfby")
const FRAME_IMAGES: Array[Texture2D] = [
	preload("uid://xku535x6lyse"),
	preload("uid://bd41objtmfeaq"),
	preload("uid://gi84o5w5wm0m"),
	preload("uid://c3w7yuxoy4p32"),
]

func get_random_frame_images() -> Texture2D:
	return FRAME_IMAGES.pick_random()

func get_random_tile_images() -> Texture2D:
	return TILE_IMGAGES.tile_images.pick_random()
	
func shuffle_imgages() -> void:
	TILE_IMGAGES.tile_images.shuffle()
	
func get_image_by_index(idx: int) -> Texture2D:
	return TILE_IMGAGES.tile_images[idx]
