extends Node2D

var save_path = "user://variables.save";

const PREFIX = 'res://scenes/level_';
const POSTFIX = '.tscn';
const LEVEL_SELECT = "res://scenes/level_select.tscn";

@onready var levelScene = null;

var coins = [];
var unlock_level = 1;
var current_level = null;

#@onready var player_point_label = %PlayerPointLabel
@onready var coins_count_label = $"../CanvasLayer/HBoxContainer/MarginContainer/CoinsCount"
@onready var level_label = $"../CanvasLayer/HBoxContainer/MarginContainer/Level"

# Called when the node enters the scene tree for the first time.
func _ready():
	#saveData(); return;
	loadData();
	loadLevel();

func changeChild(level=null):
	unloadLevel();
	if (level == null):
		current_level += 1;
	else:
		current_level = level;

	if (current_level > unlock_level):
			unlock_level = current_level
	loadLevel();
	saveData();

func unloadLevel():
	for child in get_children():
		child.queue_free();

func loadLevel():
	if(current_level != null):
		level_label.text = "Level: " + str(current_level);
		var newLevel = load(PREFIX + str(current_level) + POSTFIX)
		levelScene = newLevel.instantiate()
		add_child(levelScene);
		print(coins)
		print(current_level - 1);
		coins[current_level - 1] = 0;
		coins_count_label.text = "Coins: 0" ;
		level_label.text = "Level: " + str(current_level);
	else:
		var newLevel = load(LEVEL_SELECT)
		levelScene = newLevel.instantiate()
		coins_count_label.text = "Total Coins: " + str(_total_coins());
		level_label.text = "";
		add_child(levelScene);

func add_point():
	coins[current_level - 1] += 1;
	coins_count_label.text = "Coins: " + str(coins[current_level - 1]);

func saveData():
	var file = FileAccess.open(save_path, FileAccess.WRITE);
	file.store_var({
		"unlock_level": unlock_level,
		"coins": coins
	});
	file.close();

func loadData():
	if (FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path, FileAccess.READ);
		var data = file.get_var();
		file.close()
		unPack(data);
	else:
		unPack({});

func unPack(data):
	unlock_level = data.get('unlock_level', 1);
	print(unlock_level);
	if 'coins' in data and data['coins'] is Array and data['coins'].size() == 11:
		coins = data["coins"]
	else:
		coins.resize(11);
		coins.fill(0);

func _total_coins():
	return coins.reduce(func(a, b): return a + b);
