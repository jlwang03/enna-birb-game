extends Node

const LOADING_SCENE_DURATION: float = 1.5

var _highestScore
var _inGame: bool
var _playerColliderID: int
var _isRunning: bool # Is false when the player pauses the game

var _scene_to_load: String
var _duration: float

func _init():
	_highestScore = 0
	_inGame = false
	
	_scene_to_load = ""
	_duration = 0.0


func _process(delta):
	if _scene_to_load != "":
		_duration -= delta
		if _duration <= 0:
			get_tree().change_scene(_scene_to_load)
			_scene_to_load = ""


func StartGame():
	_inGame = true
	_isRunning = true
	
	# Load game screen
	SetLoading("res://scenes/main-scene.tscn")


func GameOver(score):
	_inGame = false
	
	# Update highest score
	if score > _highestScore:
		_highestScore = score
	
	# Load start screen
	SetLoading("res://scenes/start-scene.tscn")


func GetHighscore() -> int:
	return _highestScore


func IsRunning() -> bool:
	return _inGame and _isRunning


func SetIsRunning(running: bool):
	_isRunning = running

func SetLoading(scene: String):
	get_tree().change_scene("res://scenes/loading-scene.tscn")
	_duration = LOADING_SCENE_DURATION
	_scene_to_load = scene
