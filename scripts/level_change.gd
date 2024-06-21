extends Node2D

var save_path = "user://variables.save";

const PREFIX = 'res://scenes/level_';
const POSTFIX = '.tscn';

var levelScene = null;
var coins = 0;
var current_level = 8;

# Called when the node enters the scene tree for the first time.
func _ready():
	#saveData(); return;
	#loadData();
	loadLevel();

func changeChild():
	unloadLevel();
	if(current_level == null):
		current_level = 0;
	current_level += 1;
	loadLevel();
	saveData();

func unloadLevel():
	if (levelScene):
		levelScene.queue_free();

func loadLevel():
	level.text = "Level: " + str(current_level);	
	var newLevel = load(PREFIX + str(current_level) + POSTFIX)
	levelScene = newLevel.instantiate()
	call_deferred("add_child", levelScene)

#@onready var player_point_label = %PlayerPointLabel
@onready var coins_count = $"../CanvasLayer/HBoxContainer/CoinsCount"
@onready var level = $"../CanvasLayer/HBoxContainer/Level"

func add_point():
	coins += 1
	coins_count.text = "Coins: " + str(coins);

func saveData():
	var file = FileAccess.open(save_path, FileAccess.WRITE);
	file.store_var({
		"current_level": current_level,
		"coins": coins
	});
	file.close();

func loadData():
	if (FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path, FileAccess.READ);
		var data = file.get_var();
		unPack(data);
		file.close()

func unPack(data):
	current_level = data["current_level"]
	coins = data["coins"]
	coins_count.text = "Coins: " + str(coins);
	level.text = "Level: " + str(current_level);
	return
