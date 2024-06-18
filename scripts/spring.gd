extends Node2D
@onready var animation_player = $AnimationPlayer

enum State {IDLE = 1, COMPRESS = 2, JUMP = 3};

var state = State.IDLE;

var _body;
func _on_area_2d_body_entered(body):
	if (body.name == "Player"&&state == State.IDLE):
		state = State.COMPRESS
		animation_player.play("jump")
		_body = body;

func _on_area_2d_body_exited(body):
	if (body.name == "Player"&&state == State.COMPRESS):
		animation_player.stop()
		state = State.IDLE
		body = null

func jump():
	state = State.JUMP
	if(_body != null):
		_body.impulse(650);
		_body = null

func animation_complete():
	state = State.IDLE
	_body = null

