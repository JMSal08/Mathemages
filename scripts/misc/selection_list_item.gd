extends Button
class_name SelectionItem

@onready var RankLabel = $RankLabel
@onready var TitleLabel = $TitleLabel
@onready var FilePathLabel = $FilePathLabel
@onready var SubjectLabel = $SubjectLabel

@export var rank: int
@export var title: String
@export var file_path: String
@export var subject: String


func _on_ready() -> void:
	RankLabel.text = "#" + str(rank)
	TitleLabel.text = title
	FilePathLabel.text = file_path
	SubjectLabel.text = subject
