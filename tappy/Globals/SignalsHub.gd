extends Node


signal on_plane_died
signal on_point_scored


func emi_on_plane_died() -> void:
	on_plane_died.emit()
	
func emi_on_point_scored() -> void:
	on_point_scored.emit()
