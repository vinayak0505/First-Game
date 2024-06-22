extends Node2D

const ROCKET = "res://scenes/rocket.tscn";

func addRocket():
	var newRocket = load(ROCKET).instantiate();
	call_deferred("add_child", newRocket)


func _on_button_pressed():
	addRocket();
