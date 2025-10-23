extends Node2D

func _ready():
	await get_tree().create_timer(1.5).timeout
	$player.play("fade_out")

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")


func _on_color_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")
