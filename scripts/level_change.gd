extends Node2D

var save_path = "user://variables.save";

const PREFIX = 'res://scenes/level_';
var current_level = 0;
const POSTFIX = '.tscn';

var levelScene = null;

# Called when the node enters the scene tree for the first time.
func _ready():
	loadData();
	loadLevel();

func changeChild():
	unloadLevel();
	current_level += 1;
	loadLevel();
	saveData();

func unloadLevel():
	if (levelScene):
		levelScene.queue_free();

func loadLevel():
	var newLevel = load(PREFIX + str(current_level) + POSTFIX)
	levelScene = newLevel.instantiate()
	call_deferred("add_child", levelScene)
	
func saveData():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(current_level)

func loadData():
	if (FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path, FileAccess.READ)
		current_level = file.get_var(current_level)
	else:
		current_level = 1
