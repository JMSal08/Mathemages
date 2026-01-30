extends Control
const SELECTION_LIST_ITEM = preload("res://scenes/misc/selection_list_item.tscn")
@onready var ItemContainer = $PanelContainer/ScrollContainer/ItemContainer

func _on_ready() -> void:	
	for item in new_data_array:
		var new_list_item: SelectionItem = SELECTION_LIST_ITEM.instantiate()
		new_list_item.rank = item.rank
		new_list_item.title = item.title
		new_list_item.file_path = item.file_path
		new_list_item.subject = item.subject

func _on_main_menu_btn_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")


func _on_import_btn_pressed() -> void:
	pass


func _on_start_game_btn_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/game/agentSelection_page.tscn")
