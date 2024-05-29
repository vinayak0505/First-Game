extends Area2D

@onready var level_change = $"../../../LevelChange"

func _on_body_entered(body):
	print("reached finish")
	level_change.changeChild()
