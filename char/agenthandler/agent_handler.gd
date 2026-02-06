extends Node

#CHARACTER SETTINGS
var AGENT = ""

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
	
