extends ColorRect

func _process(_delta: float) -> void:
	size.x = 640 * ($"../../AlienTextLabel/PhraseTimer".time_left / $"../../AlienTextLabel/PhraseTimer".wait_time)
