class_name Hero extends Character

func say_infos() -> void:
	super()
	print("%s start with %d health and %s as weapon  (Hero)" % [name, health, weapon])
	
