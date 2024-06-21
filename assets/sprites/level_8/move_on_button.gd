extends AnimatableBody2D

@onready var animation_player = $AnimationPlayer

func _on_button_pressed():
	animation_player.play("move_down");


func _on_button_released():
	animation_player.play_backwards("move_down");
