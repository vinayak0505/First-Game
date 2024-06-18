extends Node2D

const BALL = 'res://scenes/ball.tscn';

func _on_timer_timeout():
	var ball = load(BALL).instantiate();
	call_deferred("add_child", ball);
