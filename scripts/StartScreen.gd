extends Node2D

const ROOT = preload("res://scenes/root.tscn")

@onready var node_2d = $Node2D

func _on_button_pressed():
	pass


func _on_button_2_pressed():
	remove_child(node_2d);
	node_2d.queue_free();
	var child = ROOT.instantiate();
	add_child(child)
