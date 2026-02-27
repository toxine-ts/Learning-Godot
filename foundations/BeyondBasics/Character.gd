class_name Character
var name: String: 
	get:
		return name
	set(new_name):
		name = new_name
		
var weapon: String: 
	get:
		return weapon
	set(new_weapon):
		weapon = new_weapon
var health: int: 
	get:
		return health
	set(new_health):
		health = clampi(new_health, 0, 100)
		
func _init(_name: String, _weapon: String, _health: int) -> void:
	name = _name
	weapon = _weapon
	health = _health
	
func say_infos() -> void:
	print("%s start with %d health and %s as weapon" % [name, health, weapon])
