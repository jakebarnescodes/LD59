extends Label

@export var phrases : Array[String]
@export var shake_magnitude : int
@export var shake_speed : float

var current_phrase_index := 0
var current_phrase : String
var type_effect_progress := 0
var paused = false

@onready var base_pos := position

func start_phrases():
	if GameController.hardmode:
		current_phrase_index = randi_range(0, phrases.size() - 1)
	else:
		current_phrase_index = 0
	current_phrase = translate_phrase(phrases[current_phrase_index])
	start_typing_phrase()

func start_typing_phrase():
	text = ""
	$TypeEffectTimer.start()
	type_effect_progress = 0

func translate_phrase(input : String) -> String:
	var output := ""
	for letter in input:
		output += GameController.translate_letter(letter)
	return output

func _on_type_effect_timer_timeout() -> void:
	if type_effect_progress < current_phrase.length():
		text += current_phrase[type_effect_progress]
		label_settings.font_size = 120 - int(type_effect_progress * 3.4)
		type_effect_progress += 1
	else:
		$TypeEffectTimer.stop()
		if GameController.hardmode:
			$PhraseTimer.wait_time = 5.0
		else:
			$PhraseTimer.wait_time = 5.0 + (5.0 / (current_phrase_index+ 1))
		$PhraseTimer.start()

func _on_phrase_timer_timeout() -> void:
	if current_phrase_index < phrases.size() - 1:
		current_phrase_index += 1
	else:
		current_phrase_index = 0
	current_phrase = translate_phrase(phrases[current_phrase_index])
	start_typing_phrase()

func _on_shake_timer_timeout() -> void:
	position.x = base_pos.x + randi_range(-shake_magnitude,shake_magnitude)
	rotation = deg_to_rad(randi_range(-shake_magnitude,shake_magnitude) / 5.0)
	$ShakeTimer.wait_time = shake_speed
	
func _on_pause_button_toggled(toggled_on: bool) -> void:
	paused = toggled_on
	$TypeEffectTimer.paused = paused
	$PhraseTimer.paused = paused
	$ShakeTimer.paused = paused
