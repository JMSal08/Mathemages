extends Control

func _on_option_button_ready() -> void:
	var window_status = DisplayServer.window_get_mode()
	var ScreenOptions = $Panel/OptionsPanel/ScreenOptions
	if window_status == 0 or window_status == 2:
		ScreenOptions.select(1)
	else:
		ScreenOptions.select(0)


func _on_main_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_screen_options_item_selected(index: int) -> void:
	if index == 0:
		print("set fullscreen")
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif index == 1:
		print("set windowed")
		var platform = OS.get_name()
		print(platform)
		if platform == "Web":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

func _on_master_volume_slider_value_changed(value: float) -> void:
	var VolumeValue = $Panel/OptionsPanel/MasterVolume/MasterVolumeValue
	var multvalue = value * 100
	VolumeValue.text = str(multvalue) + "%"

func _on_music_volume_slider_value_changed(value: float) -> void:
	var VolumeValue = $Panel/OptionsPanel/MusicVolume/MusicVolumeValue
	var multvalue = value * 100
	VolumeValue.text = str(multvalue) + "%"

func _on_sound_volume_slider_value_changed(value: float) -> void:
	var VolumeValue = $Panel/OptionsPanel/SoundVolume/SoundVolumeValue
	var multvalue = value * 100
	VolumeValue.text = str(multvalue) + "%"
	
