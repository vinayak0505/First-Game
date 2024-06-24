extends Node

signal ResetLevel;
signal StartScreen;
signal SettingScreen;
signal RootScreen;

var MusicVolumeInDb;
var SFXVolumeInDb;
var ShowControls;

const save_path = "user://settings.save";

func _save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE);
	file.store_var({
		"music": MusicVolumeInDb,
		"sfx": SFXVolumeInDb,
		"show_control": ShowControls,
	});
	file.close();

func _load_data():
	if (FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path, FileAccess.READ);
		var data = file.get_var();
		file.close()
		_un_pack(data);
	else:
		_un_pack({});
	_set_data();

func _un_pack(data):
	MusicVolumeInDb = data.get("music", linear_to_db(1));
	SFXVolumeInDb = data.get("sfx", linear_to_db(1));
	var mobile = OS.has_feature("mobile");
	ShowControls = data.get("show_control", mobile);

func _set_data():
	var music_index = AudioServer.get_bus_index("Music");
	AudioServer.set_bus_volume_db(music_index, MusicVolumeInDb);

	var sfx_index = AudioServer.get_bus_index("SFX");
	AudioServer.set_bus_volume_db(sfx_index, SFXVolumeInDb)
