extends Node2D

const FIREBALL = 'res://scenes/fire_ball.tscn';

@onready var animation_player = $AnimationPlayer

func _on_timer_timeout():
	animation_player.play("firing");

func on_fire():
	var fireball = load(FIREBALL).instantiate();
	call_deferred("add_child", fireball);
