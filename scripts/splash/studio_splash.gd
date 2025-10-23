extends Node2D

func _ready():
	$player.play("fade_out")

func _on_player_animation_finished(_anim_name: StringName) -> void:
	TransitionScene.change_scene_to_file("res://scenes/splash/splash_page.tscn")


func _on_color_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		TransitionScene.change_scene_to_file("res://scenes/splash/splash_page.tscn")
