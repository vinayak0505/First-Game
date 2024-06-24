extends Area2D

@onready var level_change = $"../../../LevelChange"

func _on_body_entered(body):
	level_change.changeChild()
