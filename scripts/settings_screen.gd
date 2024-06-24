extends Node2D

@onready var music_h_slider = $CanvasLayer/MarginContainer/VBoxContainer/MusicHBoxContainer/MusicHSlider
@onready var sfxh_slider_2 = $CanvasLayer/MarginContainer/VBoxContainer/SFXHBoxContainer2/SFXHSlider2
@onready var check_box = $CanvasLayer/MarginContainer/VBoxContainer/CheckBox

# Called when the node enters the scene tree for the first time.
func _ready():
	music_h_slider.set_value_no_signal(db_to_linear(Signals.MusicVolumeInDb));
	_on_music_h_slider_value_changed(db_to_linear(Signals.MusicVolumeInDb));
	sfxh_slider_2.set_value_no_signal(db_to_linear(Signals.SFXVolumeInDb));
	_on_sfxh_slider_2_value_changed(db_to_linear(Signals.SFXVolumeInDb));
	check_box.set_pressed_no_signal(Signals.ShowControls)


func _on_back_button_pressed():
	Signals._save_data();
	Signals.StartScreen.emit();

func _on_music_h_slider_value_changed(value):
	var music_index = AudioServer.get_bus_index("Music");
	AudioServer.set_bus_volume_db(music_index, linear_to_db(value))
	Signals.MusicVolumeInDb = linear_to_db(value);


func _on_sfxh_slider_2_value_changed(value):
	var sfx_index = AudioServer.get_bus_index("SFX");
	AudioServer.set_bus_volume_db(sfx_index, linear_to_db(value))
	Signals.SFXVolumeInDb = linear_to_db(value);

func _on_check_box_toggled(toggled_on):
	Signals.ShowControls = toggled_on;
