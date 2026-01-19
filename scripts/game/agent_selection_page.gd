extends Control

@onready var CharAnimationPlayer = $CharAnimationPlayer
@onready var LabelAnimationPlayer = $LabelAnimationPlayer

func _on_ready() -> void:
	await get_tree().create_timer(1).timeout
	LabelAnimationPlayer.play("LabelAnimation")



func _on_button_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/game/game_scene.tscn")


func _on_eadlerbtn_pressed() -> void:
	CharAnimationPlayer.play("popd")
