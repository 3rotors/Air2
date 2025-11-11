extends Node

var mob_count = 0
var score = 0
var highscore = 0

func update_highscore():
	if score > highscore:
		highscore = score
	
