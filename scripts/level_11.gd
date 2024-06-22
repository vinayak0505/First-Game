extends Node2D

var isButtonRight = true;

@onready var button = $Button
@onready var animation_player = $Gate/AnimationPlayer

const rightPos = 719;
const leftPos = 346;

func _on_button_released():
	if(isButtonRight):
		isButtonRight = false;
		button.position.x = leftPos;
	else:
		isButtonRight = true;
		button.position.x = rightPos;

func _on_boss_1_died():
	animation_player.play("open")
	button.queue_free();
