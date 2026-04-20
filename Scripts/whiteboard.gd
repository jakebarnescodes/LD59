extends Node2D

func _ready() -> void:
	GameController.start_game.connect(switch_to_entries)
	GameController.submit.connect(submitted)
	$EntriesMenu/SubmitButton.disabled = true
	switch_to_main_menu()
	
func switch_to_entries():
	$MainMenu.visible = false
	$EntriesMenu.visible = true
	$EntriesMenu/SubmitButton.disabled = false
	
func switch_to_main_menu():
	$MainMenu.visible = true
	$EntriesMenu.visible = false
	$EntriesMenu/SubmitButton.disabled = true

func _on_submit_button_pressed() -> void:
	GameController.submit.emit()
	$EntriesMenu/SubmitButton.disabled = true
	$SubmitSound.play()

func submitted():
	$EntriesMenu/SubmitButton.disabled = true
