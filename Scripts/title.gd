extends Label

func _ready() -> void:
	randomize_title()

func randomize_title():
	var A = char(randi_range(97, 122))
	var L = char(randi_range(97, 122))
	var P = char(randi_range(97, 122))
	var H = char(randi_range(97, 122))
	text = A + L + P + H + A
	if A == L or L == P or P == H or H == A or P == A or L == H:
		print("Title randomized recursively.")
		randomize_title()
