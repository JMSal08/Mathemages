extends Node

#CHARACTER SETTINGS
var AGENT = ""
var path_to_file

var response_correct = []
var response_incorrect = []

var response_intro = []
var response_outro = []
var response_timeout = []
var response_givepowerup = []
var response_usepowerup = []

var points_per_question
var timer_multiplier = 1.0

func get_agent_img(agent: String) -> Texture2D:
	var load_img = load("res://char/"+str(agent).to_lower()+"/img/"+str(agent).to_lower()+".png")
	
	return	load_img
	
func load_agent(file_path: String):
	file_path = path_to_file
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")
		push_error("Could not open file: %s" % file_path)
		return
	
	var text = file.get_as_text()
	var data = JSON.parse_string(text)
	
	if data == null:
		push_error("Error parsing JSON File")
		return
