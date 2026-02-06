extends Node

#CHARACTER SETTINGS
var AGENT = "Agent"

var response_correct = []
var response_incorrect = []

var response_intro = []
var response_outro = []
var response_timeout = []
var response_powerup = []

var points
var timer_multiplier = 1.0

func get_agent_img(agent: String) -> Texture2D:
	var load_img = load("res://char/"+str(agent)+"/img/"+str(agent)+".png")
	
	return	load_img
	
