extends Node2D

const ROOT = preload("res://scenes/root.tscn")
const SETTINGS_SCREEN = preload("res://scenes/settings_screen.tscn")
const PLAY_SCREEN = preload("res://play_screen.tscn")

func _ready():
	add_pre_child(PLAY_SCREEN);
	Signals.StartScreen.connect(show_home)
	Signals.RootScreen.connect(_on_play_pressed)
	Signals.SettingScreen.connect(_on_settings_pressed)
	
func _on_play_pressed():
	remove_all_child()
	add_pre_child(ROOT);

func _on_settings_pressed():
	remove_all_child()
	add_pre_child(SETTINGS_SCREEN);

func remove_all_child():
	for i in get_children():
		remove_child(i);
		i.queue_free();

func show_home():
	remove_all_child();
	add_pre_child(PLAY_SCREEN);
	
func change():
	print("changed");


func add_pre_child(pre_load):
	var child = pre_load.instantiate();
	add_child(child);
