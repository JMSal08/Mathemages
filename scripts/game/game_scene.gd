extends Control


var example_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet dapibus accumsan. Donec rutrum vel ante a congue. Donec posuere dui nec ullamcorper interdum. Pellentesque mattis dui ac feugiat mattis. Curabitur non egestas tortor. Aliquam lacinia porta odio id aliquet. Nulla in imperdiet sem. Ut pretium nulla sed eros semper."
var answer = "123456789012345"
var timer_value = 30 # Seconds
var Dseconds = 15 # Seconds
var Dminutes = 1 # Minutes

var AGENT = AgentHandler.AGENT

var LEVEL_COUNTER = 1
var correct_counter = 0
var incorrect_counter = 0

# TIMER COUNTER
var seconds = 0
var minutes = 0

@onready var AgentImg = $AgentImg
@onready var LevelLabel = $LevelPanel/LevelLabel
@onready var TextLabel = $TextPanel/TextLabel
@onready var TimeLabel = $TimePanel/TimeLabel
@onready var AButton = $QandAPanel/AButton
@onready var BButton = $QandAPanel/BButton
@onready var CButton = $QandAPanel/CButton
@onready var DButton = $QandAPanel/DButton



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
	add_timer_value()
	await get_tree().create_timer(1).timeout
	LEVEL_COUNTER += 1
	LevelLabel.text = AGENT + " - Level " + str(LEVEL_COUNTER)
	enable_buttons()
	scroll_text_label(example_text)

func incorrect():
	disable_buttons()
	incorrect_counter += 1
	scroll_text_label("False!")
	await get_tree().create_timer(1).timeout
	LEVEL_COUNTER += 1
	LevelLabel.text = AGENT + " - Level " + str(LEVEL_COUNTER)
	enable_buttons()
	scroll_text_label(example_text)

func _on_ready() -> void:
	scroll_text_label(example_text)
	reset_timer()
	LevelLabel.text = AGENT + " - Level " + str(LEVEL_COUNTER)
	AgentImg.texture = AgentHandler.get_agent_img(AGENT)

func _on_timer_timeout() -> void:
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1
	if seconds >= 10:
		TimeLabel.text = str(minutes)+":"+str(seconds)+" Left"
	else:
		TimeLabel.text = str(minutes)+":0"+str(seconds)+" Left"

func reset_timer():
	seconds=Dseconds
	minutes=Dminutes

func add_timer_value():
	if timer_value + seconds > 60:
		minutes +=1
		var sum_of_seconds = timer_value + seconds
		var sum_minus_sixty = sum_of_seconds-60
		seconds = sum_minus_sixty
	elif timer_value + seconds == 60:
		minutes +=1
		seconds = 0
	elif timer_value + seconds < 60:
		seconds += timer_value
	else:
		print("An error occurred within the timer")

func minus_timer_value():
	pass # DO THIS NEXT


# BELOW ARE CODE FOR BUTTONS
func _on_a_button_pressed() -> void:
	if AButton.text.to_upper() == answer.to_upper():
		correct()
	else:
		incorrect()

func _on_b_button_pressed() -> void:
	if BButton.text.to_upper() == answer.to_upper():
		correct()
	else:
		incorrect()

func _on_c_button_pressed() -> void:
	if CButton.text.to_upper() == answer.to_upper():
		correct()
	else:
		incorrect()

func _on_d_button_pressed() -> void:
	if DButton.text.to_upper() == answer.to_upper():
		correct()
	else:
		incorrect()
