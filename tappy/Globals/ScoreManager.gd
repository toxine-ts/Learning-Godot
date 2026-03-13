extends Node

const SCORE_FILE_PATH: String = "user://tappyscore.res"

var heigh_score: int = 0:
	get: 
		return heigh_score
	set(new_scrore):
		if new_scrore > heigh_score:
			heigh_score = new_scrore
			set_heigh_score()

func _ready() -> void:
	load_heigh_score()

func load_heigh_score() -> void:
	if ResourceLoader.exists(SCORE_FILE_PATH):
		var hsr: HeighScoreResource = load(SCORE_FILE_PATH)
		if hsr: heigh_score = hsr.heigh_score

func set_heigh_score() -> void:
	var hsr: HeighScoreResource = HeighScoreResource.new()
	hsr.heigh_score = heigh_score
	ResourceSaver.save(hsr, SCORE_FILE_PATH)
