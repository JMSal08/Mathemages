extends Control

var example_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet dapibus accumsan. Donec rutrum vel ante a congue. Donec posuere dui nec ullamcorper interdum. Pellentesque mattis dui ac feugiat mattis. Curabitur non egestas tortor. Aliquam lacinia porta odio id aliquet. Nulla in imperdiet sem. Ut pretium nulla sed eros semper."
var answer_to_question = "A"
var questions = []
var answers = []
var correct_counter = 0
var incorrect_counter = 0

#Character Responses
var response_correct = []
var response_incorrect = []
var response_intro = []
var response_outro = []
var response_powerup = []

@onready var TextLabel = $TextPanel/TextLabel
@onready var AButton = $QandAPanel/AButton
@onready var BButton = $QandAPanel/BButton
@onready var CButton = $QandAPanel/CButton
@onready var DButton = $QandAPanel/DButton

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

func scroll_text_label(input_text:String):
	TextLabel.visible_characters = 0
	TextLabel.text = input_text
	
	for i in TextLabel.get_parsed_text():
		TextLabel.visible_characters += 1
		await get_tree().create_timer(0.01).timeout

func disable_buttons():
	AButton.disabled = true
	BButton.disabled = true
	CButton.disabled = true
	DButton.disabled = true

func enable_buttons():
	AButton.disabled = false
	BButton.disabled = false
	CButton.disabled = false
	DButton.disabled = false

func correct():
	disable_buttons()
	correct_counter += 1
	scroll_text_label("correct!")
	await get_tree().create_timer(2).timeout
	enable_buttons()
	scroll_text_label(example_text)

func incorrect():
	disable_buttons()
	incorrect_counter += 1
	scroll_text_label("False!")
	await get_tree().create_timer(2).timeout
	enable_buttons()
	scroll_text_label(example_text)

func _on_ready() -> void:
	scroll_text_label(example_text)


func _on_a_button_pressed() -> void:
	if "A" == answer_to_question.to_upper():
		correct()
	else:
		incorrect()

func _on_b_button_pressed() -> void:
	if "B" == answer_to_question.to_upper():
		correct()
	else:
		incorrect()

func _on_c_button_pressed() -> void:
	if "C" == answer_to_question.to_upper():
		correct()
	else:
		incorrect()

func _on_d_button_pressed() -> void:
	if "D" == answer_to_question.to_upper():
		correct()
	else:
		incorrect()
