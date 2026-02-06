extends Control

@onready var CharAnimationPlayer = $CharAnimationPlayer
@onready var LabelAnimationPlayer = $LabelAnimationPlayer
@onready var CharFrame = $CharFrame
var eadlerpic = load("res://char/eadler/img/eadler.png")
var pythapic = load("res://char/pytha/img/pytha.png")

func _on_ready() -> void:
	await get_tree().create_timer(1).timeout
	LabelAnimationPlayer.play("LabelAnimation")



func _on_button_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/game/game_scene.tscn")


func _on_eadlerbtn_pressed() -> void:
	CharFrame.texture = eadlerpic
	AgentHandler.AGENT = "Eadler"
	CharAnimationPlayer.play("popd")


func _on_pythabtn_pressed() -> void:
	CharFrame.texture = pythapic
	AgentHandler.AGENT = "Pytha"
	CharAnimationPlayer.play("popd")
