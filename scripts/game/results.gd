extends Node

var LEVEL
var SCORE
var AGENT

func results(level, score) -> void:
	LEVEL = level
	SCORE = score
	AGENT = AgentHandler.AGENT
