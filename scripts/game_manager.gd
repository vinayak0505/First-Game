extends Node

var score = 0

#@onready var player_point_label = %PlayerPointLabel
@onready var coins_count = $"../../../CanvasLayer/HBoxContainer/CoinsCount"

func add_point():
	score += 1
	coins_count.text = "Coins: " + str(score);
	#player_point_label.text = "You Collected " + str(score) + ' points'
