extends StaticBody2D

var count = 0;

var play = false;
var pre = false;

func _on_button_2_pressed():
	count += 1;
	update()

func _on_button_2_released():
	count -= 1;
	update()

func _on_button_3_released():
	count -= 1;
	update()

func _on_button_3_pressed():
	count += 1;
	update()

func update():
	if(count == 2):
		play = true;
	else:
		play = false;
	if(pre != play):
		pre = play;
		if(play): $AnimationPlayer.play("move");
		else: $AnimationPlayer.play_backwards("move")
