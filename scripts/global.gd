extends Node

var _highestScore
var _inGame: bool


func _init():
	_highestScore = 0
	_inGame = false
	
	
func StartGame():
	_inGame = true
	
	# Load game screen
	get_tree().change_scene("res://scenes/main-scene.tscn")


func GameOver(score):
	_inGame = false
	
	# Update highest score
	if score > _highestScore:
		_highestScore = score
	
	# Load start screen
	get_tree().change_scene("res://scenes/start-scene.tscn")


func GetHighscore() -> int:
	return _highestScore
