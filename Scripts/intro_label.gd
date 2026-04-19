extends Label

var dots := 0

@onready var base_text = text

func _on_timer_timeout() -> void:
	if dots < 3:
		dots += 1
	else:
		dots = 0
	text = base_text
	for i in dots:
		text += "."
