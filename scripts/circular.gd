extends PathFollow2D

@export var progress_delay :float;
var speed = 0.1

var added = false;

func _process(delta):
	if(added == false):
		added = true;
		progress_ratio += progress_delay;
	progress_ratio += speed * delta;
