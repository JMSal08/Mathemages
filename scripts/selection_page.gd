extends Control

func _on_main_menu_btn_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")


func _on_import_btn_pressed() -> void:
	pass


func _on_start_game_btn_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/game/agentSelection_page.tscn")
