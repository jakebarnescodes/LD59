extends CheckBox

func _ready():
	button_pressed = GameController.hardmode

func _on_toggled(toggled_on: bool) -> void:
	GameController.enable_hardmode.emit(toggled_on)
	if toggled_on:
		$HardmodeSoundPlayer.pitch_scale = 1.0
	else:
		$HardmodeSoundPlayer.pitch_scale = 0.7
	$HardmodeSoundPlayer.play()
