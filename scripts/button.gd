extends Node2D

@onready var sprite_2d = $Sprite2D

signal pressed;
signal released;

var hasEntered = false;

func _on_area_2d_body_entered(_body):
	if(hasEntered == true): return;	
	hasEntered = true;
	pressed.emit();
	update();


func _on_area_2d_body_exited(_body):
	if(hasEntered == false): return;
	hasEntered = false;
	released.emit();
	update();

func update():
	if(hasEntered):
		sprite_2d.region_rect = Rect2(0, 16, 16, 16);
	else:
		sprite_2d.region_rect = Rect2(0, 0, 16, 16);
