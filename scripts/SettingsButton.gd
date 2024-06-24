extends Button

func _on_pressed():
	Signals.SettingScreen.emit()
	
