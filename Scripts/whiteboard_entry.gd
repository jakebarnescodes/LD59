class_name WhiteboardEntry
extends HBoxContainer

var index : int

@onready var label = $Label
@onready var lineEdit = $LineEdit

func set_index(cum : int):
	index = cum
	label.text = GameController.letters[index]

func _ready() -> void:
	GameController.update_whiteboard_entries.connect(update_whiteboard_entry)
	GameController.submit.connect(lock_entry)
	
func update_whiteboard_entry():
	lineEdit.text = GameController.get_submission_from_index(index).to_upper()
	if lineEdit.text != "":
		lineEdit.editable = false

func _on_line_edit_text_changed(new_text: String) -> void:
	lineEdit.text = new_text.to_upper()
	if new_text == "":
		GameController.submission.erase(label.text)
	else:
		GameController.submission[label.text] = lineEdit.text
	GameController.line_edited.emit()
	print(GameController.submission)

func lock_entry():
	lineEdit.editable = false
