extends Button

func _ready() -> void:
	$ResetAudio.play()

func _on_reset_button_pressed() -> void:
	get_tree().reload_current_scene()
