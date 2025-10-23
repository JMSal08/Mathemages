extends Control

var version = "ALPHA 0.1"
var webver = version + " (Web)"
var platform = OS.get_name()

var show_arrows = ">           <"
var hide_arrows = " "

var count = 0

@onready var PopupImg = $Homescreen/PopupImg
@onready var PopupPlayer = $Homescreen/PopupPlayer

# Onready Functions__________________________________

func _on_versionlabel_ready() -> void:
	var verlabel = $Homescreen/VersionLabel
	if platform == "Web":
		verlabel.text = webver
	else:
		verlabel.text = version

func _on_version_button_ready() -> void:
	var verbutton = $Homescreen/VersionButton
	if platform == "Web":
		verbutton.text = webver
	else:
		verbutton.text = version

func _on_exit_btn_ready() -> void:
	var Exitbtn = $Homescreen/VBoxButtons/ExitBtn
	if platform == "Web":
		Exitbtn.disabled = true
	else:
		pass

#____________________________________________________

# Entered Functions__________________________________

func _on_play_btn_mouse_entered() -> void:
	var ArrowsPlay = $Homescreen/VBoxArrows/ArrowsPlay
	ArrowsPlay.text = show_arrows
	PopupImg.set_texture(load("res://img/main_menu/play.svg"))
	PopupImg.scale = Vector2(0.7,0.7)
	PopupPlayer.play("RESET")
	PopupPlayer.play("slide")

func _on_options_btn_mouse_entered() -> void:
	var ArrowsOptions = $Homescreen/VBoxArrows/ArrowsOptions
	ArrowsOptions.text = show_arrows
	PopupImg.set_texture(load("res://img/main_menu/option.svg"))
	PopupImg.scale = Vector2(0.7,0.7)
	PopupPlayer.play("RESET")
	PopupPlayer.play("slide")

func _on_credits_btn_mouse_entered() -> void:
	var ArrowsCredits = $Homescreen/VBoxArrows/ArrowsCredits
	ArrowsCredits.text = show_arrows
	PopupImg.set_texture(load("res://img/main_menu/credits.svg"))
	PopupImg.scale = Vector2(0.7,0.7)
	PopupPlayer.play("RESET")
	PopupPlayer.play("slide")

func _on_score_btn_mouse_entered() -> void:
	var ArrowsScore = $Homescreen/VBoxArrows/ArrowsScore
	ArrowsScore.text = show_arrows
	PopupImg.set_texture(load("res://img/main_menu/score.svg"))
	PopupImg.scale = Vector2(0.7,0.7)
	PopupPlayer.play("RESET")
	PopupPlayer.play("slide")

func _on_exit_btn_mouse_entered() -> void:
	var ArrowsExit = $Homescreen/VBoxArrows/ArrowsExit
	ArrowsExit.text = show_arrows
	PopupImg.set_texture(load("res://img/main_menu/exit.svg"))
	PopupImg.scale = Vector2(0.7,0.7)
	PopupPlayer.play("RESET")
	PopupPlayer.play("slide")
#____________________________________________________

# Exit Functions_____________________________________

func _on_play_btn_mouse_exited() -> void:
	var ArrowsPlay = $Homescreen/VBoxArrows/ArrowsPlay
	ArrowsPlay.text = hide_arrows
	PopupPlayer.play_backwards("slide")

func _on_options_btn_mouse_exited() -> void:
	var ArrowsOptions = $Homescreen/VBoxArrows/ArrowsOptions
	ArrowsOptions.text = hide_arrows
	PopupPlayer.play_backwards("slide")

func _on_credits_btn_mouse_exited() -> void:
	var ArrowsCredits = $Homescreen/VBoxArrows/ArrowsCredits
	ArrowsCredits.text = hide_arrows
	PopupPlayer.play_backwards("slide")

func _on_score_btn_mouse_exited() -> void:
	var ArrowsScore = $Homescreen/VBoxArrows/ArrowsScore
	ArrowsScore.text = hide_arrows
	PopupPlayer.play_backwards("slide")

func _on_exit_btn_mouse_exited() -> void:
	var ArrowsExit = $Homescreen/VBoxArrows/ArrowsExit
	ArrowsExit.text = hide_arrows
	PopupPlayer.play_backwards("slide")
#____________________________________________________

# Pressed Functions__________________________________

func _on_playbtn_pressed() -> void:
	print("Play Pressed")
	TransitionScene.change_scene_to_file("res://scenes/selection_page.tscn")

func _on_optionsbtn_pressed() -> void:
	print("Options Pressed")
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")
	

func _on_scorebtn_pressed() -> void:
	print("Score Pressed")
	get_tree().change_scene_to_file("res://scenes/score_page.tscn")

func _on_creditsbtn_pressed() -> void:
	print("Credits Pressed")
	get_tree().change_scene_to_file("res://scenes/credits_page.tscn")

func _on_exitbtn_pressed() -> void:
	get_tree().quit()

func _on_version_button_pressed() -> void:
	count = count + 1
	var MainMenu = get_node(".")
	MainMenu.count = count
	print(count)
	if count == 50:
		TransitionScene.change_scene_to_file("res://scenes/scene.tscn")
