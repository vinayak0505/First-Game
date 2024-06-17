extends Node2D


@export var SPEED : int = 60;
@export var FASTSPEED : int = 150;
var direction = 1;

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var dash_ray_cast_right = $DashRayCastRight
@onready var dash_ray_cast_left = $DashRayCastLeft
@onready var timer = $Timer

var dashing = false;
var newSpeed = SPEED;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		animated_sprite.flip_h = true
		dashing = false;
		direction = -1
		newSpeed = SPEED;
	if ray_cast_left.is_colliding():
		animated_sprite.flip_h = false
		dashing = false;
		direction = 1
		newSpeed = SPEED;
	if dashing == false:
		if direction == 1 && dash_ray_cast_right.is_colliding():
			dash();
		if direction == -1 && dash_ray_cast_left.is_colliding():
			dash();
	position.x += direction * newSpeed * delta;


func dash():
	dashing = true;
	newSpeed = 0;
	animated_sprite.play("observed");
	timer.start(1);

func _on_timer_timeout():
	newSpeed = FASTSPEED;
	animated_sprite.play("idle");
