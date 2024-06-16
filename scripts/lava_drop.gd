extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var moving = false;
var remove = false;

func _on_timer_timeout():
	moving = true;
	animated_sprite_2d.play("moving_down");

const SPEED = 60;
var direction = -1;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(moving):
		position.y -= direction * SPEED * delta
	
@onready var kill_zone = $KillZone

@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	print("working")
	if(remove == false):
		return;
	moving = false;
	animation_player.play("remove");
	kill_zone.queue_free()
	animated_sprite_2d.play("remove");


func _on_remove_timer_timeout():
	print("timer called")
	remove = true;
