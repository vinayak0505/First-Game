extends Button

@onready var level_change = $"../../../../../..";
var level;

func _ready():
	level = name.replace("Button", "").to_int();
	if (level_change.unlock_level >= level):
		disabled = false;
	else:
		disabled = true;

func _pressed():
	if (disabled): return;
	level_change.changeChild(name.to_int());
