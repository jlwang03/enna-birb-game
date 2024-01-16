extends Node

onready var _tutorial_screens
onready var _credits_screens

func _ready():
	_tutorial_screens = $tutorial
	_tutorial_screens.hide()
	_credits_screens = $credits
	_credits_screens.hide()
	
	$Score.text = "Max Distance: %dm" % Global.GetHighscore()

func _on_start_pressed():
	Global.StartGame()

func _on_tutorial_pressed():
	_tutorial_screens.Open()

func _on_credits_pressed():
	_credits_screens.Open()

func _on_quit_pressed():
	get_tree().quit()

