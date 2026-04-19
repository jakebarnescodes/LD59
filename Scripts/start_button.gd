extends Button

func _on_pressed() -> void:
	GameController.start_game.emit()
