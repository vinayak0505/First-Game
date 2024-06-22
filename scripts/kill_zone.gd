extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	if(Engine.time_scale == 0.5):
		return;
	if(body.name == "Player"):
		print("You Died!")
		Engine.time_scale = 0.5
		timer.start()
		body.get_node("CollisionShape2D").queue_free()
	else:
		body.queue_free();

func _on_timer_timeout():
	Engine.time_scale = 1.0;
	get_tree().reload_current_scene()
	
