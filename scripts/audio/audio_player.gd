extends AudioStreamPlayer

@onready var AudioPlay = $"."
@onready var MainSoundTrack = preload("res://audio/soundtracks/MainMenu.mp3")

func _on_ready() -> void:
	await get_tree().create_timer(2).timeout
	AudioPlay.stream = MainSoundTrack
	AudioPlay.play()

func PlayAudio(streamname: String) -> void:
	var streamloader = load(streamname)
	AudioPlay.stream = streamloader
	AudioPlay.play(streamloader)
