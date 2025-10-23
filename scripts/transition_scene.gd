extends CanvasLayer

@onready var player = $player

func change_scene_to_file(target: String) -> void:
	player.play("Dissolve")
	await player.animation_finished
	get_tree().change_scene_to_file(target)
	player.play_backwards("Dissolve")
	await player.animation_finished
