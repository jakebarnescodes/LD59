extends CanvasLayer

@export_multiline var good_ending_text : String
@export_multiline var bad_ending_text : String

func _ready() -> void:
	GameController.submit.connect(display_ending)

func display_ending():
	$Timer.start()
	if GameController.good_ending:
		$EndingLabel.text = good_ending_text
	else:
		$EndingLabel.text = bad_ending_text
		
	
func _on_timer_timeout() -> void:
	visible = true
	$AnimationPlayer.play("ending")
