extends Label

func _ready() -> void:
	GameController.start_game.connect(start_clock)
	GameController.submit.connect(stop_clock)
	visible = false

func _process(_delta: float) -> void:
	var secs_remaining = int($HardmodeTimer.time_left)
	@warning_ignore("integer_division") var minutes = secs_remaining / 60
	var seconds = secs_remaining % 60
	text = "%02d:%02d" % [minutes,seconds]

func start_clock():
	if GameController.hardmode:
		visible = true
		$HardmodeTimer.start()

func stop_clock():
	$HardmodeTimer.paused = true

func _on_hardmode_timer_timeout() -> void:
	GameController.submit.emit()
