extends Camera3D

@export var decay : float = 0.8
@export var max_offset : Vector3 = Vector3(0.08,0.08,0)
@export var max_roll : float = 0.1

var trauma : float = 0.0
var trauma_power : int = 2
var offset : Vector3 = Vector3.ZERO

@onready var base_pos : Vector3 = global_position

func _ready() -> void:
	GameController.story_event_1.connect(add_trauma)

func _process(delta: float) -> void:
	var mouse_pos = get_mouse_pos()
	rotation.x = -mouse_pos.y / 30000
	rotation.y = -mouse_pos.x / 30000
	
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()
		print(trauma)

func add_trauma():
	trauma += 1

func get_mouse_pos(screen_center_is_origin : bool = true):
	var mouse = get_viewport().get_mouse_position()
	if screen_center_is_origin:
		mouse.x -=  get_viewport().get_visible_rect().size.x / 2
		mouse.y -=  get_viewport().get_visible_rect().size.y / 2
	return mouse

func shake():
	var amount = pow(trauma, trauma_power)
	#rotation = max_roll * amount * randf_range(-1,1)
	offset.x = max_offset.x * amount * randf_range(-1,1)
	offset.y = max_offset.y * amount * randf_range(-1,1)
	global_position = base_pos + offset
	
