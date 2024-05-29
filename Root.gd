extends Node2D

const PREFIX = 'res://scenes/level_';
var current_level = 0;
const POSTFIX = '.tscn';
var levelScene = null;

# Called when the node enters the scene tree for the first time.
func _ready():
	changeChild()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func changeChild():
	if(levelScene):
		levelScene.queue_free();
	current_level += 1
	var newLevel = load(PREFIX + str(current_level) + POSTFIX)
	levelScene = newLevel.instantiate()
	add_child(levelScene)
