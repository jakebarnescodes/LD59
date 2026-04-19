extends CheckBox

func _ready():
	button_pressed = GameController.hardmode

func _on_toggled(toggled_on: bool) -> void:
	GameController.hardmode = toggled_on
