extends Node

@onready var hobbit: Hobbit = $Hobbit
@onready var wizard: Wizard = $Wizard


func _ready() -> void:
	hobbit.kill_wizard.connect(_on_hobbit_kill_wizard, ConnectFlags.CONNECT_ONE_SHOT)
	wizard.cast_spell.connect(_on_wizard_cast_spell)

func _on_wizard_cast_spell() -> void:
	hobbit.hit_by_spell()


func _on_hobbit_kill_wizard() -> void:
	wizard.scale = Vector2(0.1,0.1) # Replace with function body.
	#hobbit.kill_wizard.disconnect(_on_hobbit_kill_wizard)
