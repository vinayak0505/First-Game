extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var catch_timer = $CatchTimer
@onready var reset_timer = $ResetTimer
@onready var collision_shape_2d = $KillZone/CollisionShape2D

#for checking if the animation has triggered or not
var started = false;

func _on_body_entered(body):
	if(started): 
		return;
	started = true;
	animated_sprite_2d.play("ready");
	catch_timer.start(1);

@onready var audio_stream_player = $AudioStreamPlayer

func _on_timer_timeout():
	reset_timer.start(1);
	animated_sprite_2d.play("catch");
	collision_shape_2d.set_disabled(false);
	audio_stream_player.play();

func _on_reset_timer_timeout():
	print("reset")
	collision_shape_2d.set_disabled(true);
	animated_sprite_2d.play("idle");
	started = false;
