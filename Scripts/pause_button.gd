extends Button

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		text = "PLAY"
		$"../../AlienTextLabel/StaticAudioPlayer".stream_paused = true
		$"../../AlienTextLabel/WhispersPlayer".stream_paused = true
	else:
		text = "PAUSE"
		$"../../AlienTextLabel/StaticAudioPlayer".stream_paused = false
		$"../../AlienTextLabel/WhispersPlayer".stream_paused = false
	$PauseButtonAudio.play()
