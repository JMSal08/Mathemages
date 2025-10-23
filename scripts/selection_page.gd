extends Control

func _on_main_menu_btn_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")
