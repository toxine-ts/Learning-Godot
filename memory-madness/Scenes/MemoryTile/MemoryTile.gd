class_name MemoryTile

extends TextureButton

 
@onready var frame_texture: TextureRect = $FrameTexture
@onready var image_texture: TextureRect = $ImageTexture


func _ready() -> void:
	reveal(false)

func setup(image: Texture2D, frame: Texture2D) -> void:
	frame_texture.texture = frame
	image_texture.texture = image

func kill_pair() -> void:
	z_index = 10
	disabled = true
	var tween: Tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "rotation_degrees", 720, 0.5)
	tween.tween_property(self, "scale", Vector2(1.5,1.5), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.5)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.2)
	

func match_other_tiles(otherTile: MemoryTile) -> bool:
	return otherTile != self and otherTile.image_texture.texture == image_texture.texture

func reveal(isRevealed: bool) -> void:
	frame_texture.visible = isRevealed
	image_texture.visible = isRevealed


func _on_pressed() -> void:
	if !Scorer.is_selection_enable: return
	reveal(true)
	SignalHub.on_emit_tile_selected(self)
	print(Scorer.is_selection_enable)
