extends Node

const LAVADROP = 'res://scenes/lava_drop.tscn';

func _on_timer_timeout():
	var lavaDrop = load(LAVADROP).instantiate();
	call_deferred("add_child", lavaDrop);
	
