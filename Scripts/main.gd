extends Node

func _process(_delta):
	if Input.is_action_just_released("ESC"):
		get_tree().reload_current_scene()
