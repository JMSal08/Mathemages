extends Control
const SELECTION_LIST_ITEM = preload("res://scenes/misc/selection_list_item.tscn")
@onready var ItemContainer = $PanelContainer/ScrollContainer/ItemContainer

func _on_ready() -> void:
	var new_data_array: Array = gather_data()
	
	for i in ItemContainer.get_children():
		i.queue_free()
	
	for item in new_data_array:
		var new_list_item: SelectionItem = SELECTION_LIST_ITEM.instantiate()
		new_list_item.rank = item.rank
		new_list_item.title = item.title
		new_list_item.file_path = item.file_path
		new_list_item.subject = item.subject
		
		ItemContainer.add_child(new_list_item)
	
func gather_data() -> Array:
	var data_array = [
		{
			"rank": 1,
			"title" : "Evaulating Functions",
			"file_path" :"res://package/default/EvaluateFunctions.json",
			"subject" : "Mathematics" 
		}
		
	]
	return data_array

func _on_main_menu_btn_pressed() -> void:
	TransitionScene.change_scene_to_file("res://scenes/main_menu.tscn")


func _on_import_btn_pressed() -> void:
	pass


func _on_start_game_btn_pressed() -> void:
	PackageHandler.load_questions("placeholder")
	TransitionScene.change_scene_to_file("res://scenes/game/agentSelection_page.tscn")
