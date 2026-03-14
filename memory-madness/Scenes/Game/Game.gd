extends Control

const MEMORY_TILE = preload("uid://cql5xay1b52lu")

@onready var grid_container: GridContainer = $HB/GridContainer
@onready var scorer: Scorer = $Scorer
@onready var moves_label: Label = $HB/VB/HB/MovesLabel
@onready var pairs_label: Label = $HB/VB/HB2/PairsLabel
@onready var game_over_ui: PanelContainer = $MarginContainer/GameOverUi

func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	
func on_level_selected(level_setting: LevelSettings) -> void:
	var lds: LevelDataSelecter = LevelDataSelecter.new()
	var selected_images: Array[Texture2D] = lds.get_image_for_level_setting(level_setting)
	var frame_image: Texture2D = ImageManager.get_random_frame_images()
	
	grid_container.columns = level_setting.col
	for image in selected_images:
		var new_title = MEMORY_TILE.instantiate()
		grid_container.add_child(new_title)
		new_title.setup(image, frame_image)
	scorer.clear_new_game(level_setting)

func _process(_delta: float) -> void:
	pairs_label.text = scorer.get_pair_str()
	moves_label.text = scorer.get_move_made_str()

func _on_exit_button_pressed() -> void:
	SignalHub.on_emit_exit_level()
	for memoryTitle in grid_container.get_children():
		memoryTitle.queue_free()
