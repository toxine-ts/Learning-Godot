extends Node


var heigh_score: int = 0:
	get: 
		return heigh_score
	set(new_scrore):
		if new_scrore > heigh_score:
			heigh_score = new_scrore
