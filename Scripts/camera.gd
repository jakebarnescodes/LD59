extends Camera3D

func _process(_delta: float) -> void:
	var mouse_pos = get_mouse_pos()
	
	rotation.x = -mouse_pos.y / 30000
	rotation.y = -mouse_pos.x / 30000

func get_mouse_pos(screen_center_is_origin : bool = true):
	var mouse = get_viewport().get_mouse_position()
	if screen_center_is_origin:
		mouse.x -=  get_viewport().get_visible_rect().size.x / 2
		mouse.y -=  get_viewport().get_visible_rect().size.y / 2
	return mouse
