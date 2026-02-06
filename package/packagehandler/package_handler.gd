extends Control

var title = ""
var path_to_file = ""

var edition = ""
var subject = ""
var questions: Array = []
var answers: Array = []
var choices: Array = []

func load_questions(file_path: String):
	file_path = path_to_file
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")
		push_error("Could not open file: %s" % file_path)
		return
	
	var text = file.get_as_text()
	var data = JSON.parse_string(text)
	
	if data == null:
		TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")
		push_error("Error parsing JSON File")
		return
	
	edition = ""
	edition= data.get("edition", "")
	if edition.to_lower() != "mathemages":
		push_error("Not Valid Mathemages JSON file")
		return
		
	subject = data.get("subject", "")
	questions = data.get("questions", [])
	
	answers.clear()
	choices.clear()
	
	for q in questions:
		answers.append(q["answer"])
		choices.append(q["choices"])
	
	print(questions)
	print(answers)
	print(choices)

func randomizer():
	var questions_length = questions.size()
	var answers_length = answers.size()
	print("QLength:  " + questions_length)
	print("ALength:  " + answers_length)
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var random_question_index = rng.randi_range(0, questions_length - 1)
	print("RandomQuestionIndex: " + random_question_index)
	
	return random_question_index
