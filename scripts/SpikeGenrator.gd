extends Node2D

@export var count:= 1;

const SPIKE = 'res://scenes/spike.tscn';

func _ready():
	for i in count:
		var spike = load(SPIKE).instantiate();
		spike.position = Vector2(i * 10, 0);
		call_deferred("add_child", spike);
	
