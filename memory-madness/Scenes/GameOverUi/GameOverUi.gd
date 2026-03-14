extends PanelContainer

@onready var label_2: Label = $VBoxContainer/Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_game_over.connect(on_game_over)
	SignalHub.on_exit_level.connect(on_exit_level)
	
func on_exit_level() -> void:
	hide()

func on_game_over(move_made: int) -> void:
	label_2.text = "you win with %d moves" % move_made
	show()
