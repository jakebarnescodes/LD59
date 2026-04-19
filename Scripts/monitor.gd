extends Node3D

func _ready() -> void:
	GameController.submit.connect(turn_off_screen)
	
func turn_off_screen():
	$ScreenPlane.visible = false
