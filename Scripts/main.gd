extends Node

var tunnel_loop := preload("res://Assets/SFX/TunnelLoop.wav")
var nightmare_loop := preload("res://Assets/SFX/NightmareLoop.wav")

func _ready() -> void:
	switch_ambience()
	GameController.start_game.connect(switch_ambience)
	
func switch_ambience():
	if GameController.hardmode:
		$AmbienceAudio.stream = nightmare_loop
		$AmbienceAudio.volume_db = -10
	else:
		$AmbienceAudio.stream = tunnel_loop
		$AmbienceAudio.volume_db = -15
	$AmbienceAudio.play()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Fullscreen") and !OS.has_feature("web"):
		var mode = DisplayServer.window_get_mode()

		if mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
