extends Control
const SELECTION_LIST_ITEM = preload("res://scenes/misc/selection_list_item.tscn")
@onready var ItemContainer = $PanelContainer/ScrollContainer/ItemContainer
@onready var SelectedLabel = $SelectedLabel

func _on_ready() -> void:
	pass

func _on_main_menu_btn_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")


func _on_import_btn_pressed() -> void:
	pass


func _on_start_game_btn_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/game/agentSelection_page.tscn")

func button_pressed() -> void:
	pass
