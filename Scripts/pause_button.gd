extends Button

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		text = "PLAY"
	else:
		text = "PAUSE"
