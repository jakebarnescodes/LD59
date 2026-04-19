extends Node

var letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var hint_letters = ["A","E","I","O","U","T","N","W","R","S"]
var answers : Dictionary = {}
var submission : Dictionary = {}
var story_event := 0
var good_ending = false
var hardmode = false

signal start_game
signal update_whiteboard_entries
signal line_edited

signal story_event_0
signal story_event_1
signal story_event_2
signal story_event_3

@warning_ignore("unused_signal") signal submit

func _ready() -> void:
	start_game.connect(start)
	line_edited.connect(story_event_check)
	submit.connect(check_submission)

func start():
	generate_answers()
	clear_submission()
	give_random_answers()

func generate_answers():
	var value_letters = letters.duplicate_deep()
	for letter in letters:
		var value_index = randi_range(0, value_letters.size() - 1)
		answers[letter] = value_letters[value_index]
		value_letters.remove_at(value_index)
	print("Answers: " + str(answers))

func clear_submission():
	submission = {}
	#for letter in letters:
		#submission[letter] = ""

func give_random_answers():
	if GameController.hardmode:
		give_random_answer()
		give_random_answer()
		give_random_answer()
	else:
		give_random_answer("H")
		give_random_answer("L")
		give_random_answer("M")
		give_random_answer("N")
		give_random_answer("E")

func give_random_answer(val : String = ""):
	var value = val
	if value == "":
		value = hint_letters[randi_range(0, hint_letters.size() - 1)]
	var key = find_key_by_value(answers, value)
	submission[key] = answers[key]
	print("Random Answer: " + str(key) + " = " + str(submission[key]))
	update_whiteboard_entries.emit()
	
func get_submission_from_index(entry_index : int) -> String:
	if submission.has(letters[entry_index]):
		return submission[letters[entry_index]]
	else:
		return ""
	
func translate_letter(input : String) -> String:
	input = input.to_upper()
	if input == " ":
		return "\n"
	return find_key_by_value(answers,input)

func find_key_by_value(dict: Dictionary, target):
	for key in dict:
		if dict[key] == target:
			return key
	return null

func story_event_check():
	var entries_filled = submission.size()
	if story_event == 0 and entries_filled >= 10:
		story_event_0.emit()
		story_event += 1
	elif story_event == 1 and entries_filled >= 15:
		story_event_1.emit()
		story_event += 1
	elif story_event == 2 and entries_filled >= 20:
		story_event_2.emit()
		story_event += 1
	elif story_event == 3 and entries_filled >= 26:
		story_event_3.emit()
		story_event += 1

func check_submission():
	for letter in letters:
		if !submission.has(letter) or answers[letter] != submission[letter]:
			good_ending = false
			return good_ending
	good_ending = true
	return good_ending
