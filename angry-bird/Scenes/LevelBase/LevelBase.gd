extends Node

@onready var animal_spawn_point: Marker2D = $AnimalSpawnPoint
const ANIMAL: PackedScene = preload("uid://dnlcwagv1imes")

func _ready() -> void:
	SignalHub.on_animal_died.connect(animal_spawn)
	animal_spawn()


func animal_spawn() -> void:
	var new_animal: Animal = ANIMAL.instantiate()
	new_animal.position = animal_spawn_point.position
	call_deferred("add_child", new_animal)
