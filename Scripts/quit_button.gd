extends Button

func _ready():
	if OS.has_feature("web"):
		visible = false

func _on_pressed() -> void:
	get_tree().quit()
