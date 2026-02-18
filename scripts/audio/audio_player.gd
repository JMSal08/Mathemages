extends AudioStreamPlayer

@onready var AudioPlay = $"."
@onready var MainSoundTrack = preload("res://audio/soundtracks/MainMenuV2.mp3")
@onready var SoundtrackOne = preload("res://audio/soundtracks/SoundtrackOne.mp3")
@onready var SoundtrackTwo = preload("res://audio/soundtracks/SoundtrackTwo.mp3")

func _on_ready() -> void:
	await get_tree().create_timer(2).timeout
	AudioPlay.stream = MainSoundTrack
	AudioPlay.play()

func PlayAudio(streamname: String) -> void:
	var streamloader = load(streamname)
	AudioPlay.stream = streamloader
	AudioPlay.play(streamloader)


func PlayMainMenuSound() -> void:
	AudioPlay.stream = MainSoundTrack
	AudioPlay.play()

func PlaySoundTrackOne() -> void:
	AudioPlay.stream = SoundtrackOne
	AudioPlay.play()

func PlaySoundTrackTwo() -> void:
	AudioPlay.bus()
	AudioPlay.stream = SoundtrackTwo
	AudioPlay.play()
