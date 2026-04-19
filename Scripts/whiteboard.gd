extends Node2D

func _ready() -> void:
	GameController.start_game.connect(switch_to_entries)
	$EntriesMenu/SubmitButton.disabled = true
	
func switch_to_entries():
	$MainMenu.visible = false
	$EntriesMenu.visible = true
	$EntriesMenu/SubmitButton.disabled = false

func _on_submit_button_pressed() -> void:
	GameController.submit.emit()
	$EntriesMenu/SubmitButton.disabled = true
