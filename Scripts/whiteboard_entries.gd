extends GridContainer

@export var entry_scene_path : String

func _ready() -> void:
	var index = 0
	var scene = load(entry_scene_path)
	for letter in GameController.letters:
		var instance = scene.instantiate()
		add_child(instance as WhiteboardEntry)
		instance.set_index(index)
		index = index + 1
