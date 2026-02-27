@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var player: Character = Character.new("Character", "Axe", 100)
	var hero: Hero = Hero.new("Hero", "Axe", 100)
	
	player.say_infos()
	hero.say_infos()
	
	var playerId: int = player.get_instance_id()
