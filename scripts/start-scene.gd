extends Node

onready var main_scene

func _ready():
	$Score.text = "Highscore: %d" % Global.GetHighscore()

func _on_start_pressed():
	Global.StartGame()

func _on_leaderboard_pressed():
	pass # Replace with function body.


func _on_credits_pressed():
	pass # Replace with function body.
