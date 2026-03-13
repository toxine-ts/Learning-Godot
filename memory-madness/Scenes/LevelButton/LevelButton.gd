extends TextureButton

@onready var label: Label = $Label

@export var level_settings: LevelSettings

func _ready() -> void:
	label.text = str(level_settings)


func _on_pressed() -> void:
	SignalHub.on_emit_level_selected(level_settings) 
