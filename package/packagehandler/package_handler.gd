extends Control

var title = ""
var path_to_file = ""

var edition = ""
var subject = ""
var questions: Array = [] #Includes the answers and choices
var question: Array = [] # The question itself
var answers: Array = []
var choices: Array = []

var choice_one
var choice_two
var choice_three
var choice_four

var selected_question
var selected_answer
var selected_choices
var gameover_condition = false

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
		question.append(q["question"])
		answers.append(q["answer"])
		choices.append(q["choices"])
	
	print(questions)
	print(answers)
	print(choices)

func randomizer():
	var questions_length = question.size()
	var answers_length = answers.size()
	print("QLength:  " + str(questions_length))
	print("ALength:  " + str(answers_length))
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	if questions_length > 0:
		var random_question_index = rng.randi_range(0, questions_length - 1)
		print("RandomQuestionIndex: " + str(random_question_index))
		
		return random_question_index
	else:
		return -1

func handler():
	var random_index = randomizer()
	if random_index == -1:
		gameover_condition = true
	else:
		selected_question = str(question[random_index])
		print(selected_question)
		selected_answer = str(answers[random_index])
		print(selected_answer)
		selected_choices = choices[random_index]
		print(selected_choices)
		selected_choices.shuffle()
		print("shuffled: " + str(selected_choices))
		question.remove_at(random_index)
		answers.remove_at(random_index)
		choices.remove_at(random_index)
		
		choice_one = str(selected_choices[0])
		choice_two = str(selected_choices[1])
		choice_three = str(selected_choices[2])
		choice_four = str(selected_choices[3])
