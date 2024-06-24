extends Node2D

@onready var music_h_slider = $CanvasLayer/MarginContainer/VBoxContainer/MusicHBoxContainer/MusicHSlider
@onready var sfxh_slider_2 = $CanvasLayer/MarginContainer/VBoxContainer/SFXHBoxContainer2/SFXHSlider2

# Called when the node enters the scene tree for the first time.
func _ready():
	var music_index = AudioServer.get_bus_index("Music");
	var music_value = AudioServer.get_bus_volume_db(music_index);
	var sfx_index = AudioServer.get_bus_index("SFX");
	var sfx_value = AudioServer.get_bus_volume_db(sfx_index);
	music_h_slider.set_value_no_signal(db_to_linear(music_index));
	sfxh_slider_2.set_value_no_signal(db_to_linear(sfx_index));


func _on_back_button_pressed():
	Signals.StartScreen.emit();


func _on_music_h_slider_value_changed(value):
	var music_index = AudioServer.get_bus_index("Music");
	AudioServer.set_bus_volume_db(music_index, linear_to_db(value))


func _on_sfxh_slider_2_value_changed(value):
	var sfx_index = AudioServer.get_bus_index("SFX");
	AudioServer.set_bus_volume_db(sfx_index, linear_to_db(value))
