extends Node2D

var multi_points = [];

func _init():
	Signals.DrawPoint.connect(_add_points);
	
func _add_points(points):
	multi_points.push_back(points);

func _draw():
	for points in multi_points:
		draw_dashed_line(points[0], points[1],Color('#ffffff'));
		
func _ready():
	print('ready');
	queue_redraw()
