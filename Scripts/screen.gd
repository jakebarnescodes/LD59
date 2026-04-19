extends Node2D

func _ready() -> void:
	GameController.start_game.connect(switch_to_intro)
	switch_to_main_menu()
	
func switch_to_main_menu():
	$MainMenu.visible = true
	$Intro.visible = false
	$Phrases.visible = false

func switch_to_intro():
	$MainMenu.visible = false
	$Intro.visible = true
	$Phrases.visible = false
	$Intro/IntroTimer.start()

func switch_to_phrases():
	$MainMenu.visible = false
	$Intro.visible = false
	$Phrases.visible = true
	$Phrases/AlienTextLabel.start_phrases()
	if GameController.hardmode:
		$Phrases/VideoControlBar.visible = false
	else:
		$Phrases/VideoControlBar.visible = true
	
func _on_intro_timer_timeout() -> void:
	switch_to_phrases()
