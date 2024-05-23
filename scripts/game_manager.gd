extends Node

var score = 0

@onready var player_point_label = %PlayerPointLabel

func add_point():
	score += 1
	player_point_label.text = "You Collected " + str(score) + ' points'
