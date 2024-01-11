extends Node

onready var _tutorial_screens

func _ready():
	_tutorial_screens = $tutorial
	_tutorial_screens.hide()
	
	$Score.text = "Highscore: %d" % Global.GetHighscore()

func _on_start_pressed():
	Global.StartGame()

func _on_tutorial_pressed():
	_tutorial_screens.show()

func _on_credits_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()

