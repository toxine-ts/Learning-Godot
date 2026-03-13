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
	disabled = true
	modulate = Color.TRANSPARENT

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
