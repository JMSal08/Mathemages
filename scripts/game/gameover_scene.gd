extends Control

@onready var level = $level
@onready var score = $score
@onready var agent = $agent
@onready var charframe = $CharFrame

var eadlerpic = load("res://char/eadler/img/eadler.png")
var pythapic = load("res://char/pytha/img/pytha.png")

var level_var = 0
var score_var = 0
var agent_var = "string"

func _on_ready() -> void:
	level_var = Results.LEVEL
	score_var = Results.SCORE
	agent_var = Results.AGENT
	
	level.text = "Level: " + str(level_var)
	score.text = "Score: " + str(score_var)
	agent.text = "Instructor: " + str(agent_var)
	print(agent_var)
	
	if agent_var == "Eadler":
		charframe.texture = eadlerpic
	elif agent_var == "Pytha":
		charframe.texture = pythapic

func _on_main_menu_pressed() -> void:
	AudioPlayer.PlayMainMenuSound()
	TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")
