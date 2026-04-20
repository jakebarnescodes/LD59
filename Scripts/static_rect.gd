extends TextureRect

func _on_timer_timeout() -> void:
	if randf() < 0.5:
		flip_h = !flip_h
	else:
		flip_v = !flip_v
