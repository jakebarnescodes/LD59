class_name MainSpotlight
extends SpotLight3D

@export var max_energy : float = 0.0
@export var flicker_magnitude : float = 0.0
@export var flicker_speed : float = 5
@export var sway_magnitude : float = 1.0
@export var sway_speed : float = 1

var target_energy := 0.0

func _ready() -> void:
	GameController.start_game.connect(turn_on)
	GameController.story_event_0.connect(light_event_0)
	GameController.story_event_1.connect(light_event_1)
	GameController.story_event_2.connect(light_event_2)
	GameController.submit.connect(light_event_3)
	GameController.enable_hardmode.connect(hard)
	if GameController.hardmode:
		light_color = Color.DARK_ORANGE
	else:
		light_color = Color.WHITE
	
func hard(is_hard):
	if is_hard:
		light_color = Color.DARK_ORANGE
	else:
		light_color = Color.WHITE

func turn_on():
	$AnimationPlayer.play("turn_on")
	if GameController.hardmode:
		light_color = Color.DARK_ORANGE

func _process(delta):
	if randf() < 0.1:
		target_energy = randf_range(max_energy - flicker_magnitude, max_energy + flicker_magnitude)

	light_energy = lerp(light_energy, target_energy, flicker_speed * delta)
	
	rotation.x = deg_to_rad(-90 + (cos(Engine.get_physics_frames() * 8 * 0.00416 * sway_speed) * sway_magnitude))

func light_event_0():
	$AnimationPlayer.play("hard_flicker")

func light_event_1():
	$AnimationPlayer.play("hard_sway")

func light_event_2():
	$AnimationPlayer.play("red")
	
func light_event_3():
	await get_tree().create_timer(randf_range(1.0,2.0)).timeout
	$AnimationPlayer.play("submission_time")
