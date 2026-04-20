extends OmniLight3D

var red : bool = false

func _on_timer_timeout() -> void:
	if GameController.hardmode and !red:
		$AnimationPlayer.play("red")
		red = true
	elif !GameController.hardmode and red:
		$AnimationPlayer.play("white")
		red = false
