extends Control

@onready var CharAnimationPlayer = $CharAnimationPlayer
@onready var LabelAnimationPlayer = $LabelAnimationPlayer

func _on_ready() -> void:
	await get_tree().create_timer(1).timeout
	LabelAnimationPlayer.play("LabelAnimation")
