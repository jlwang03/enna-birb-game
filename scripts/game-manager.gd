extends Node2D


const SPEED_MULTIPLIER: float = 1.0
const SCORE_INCREASE_COOLDOWN: float = 0.1

onready var _ui_pause
onready var _ui_hearts
onready var _ui_score

var _score
var _health
var _speed

var _score_delta_time

func _init():
	_score = 0
	_health = 2
	_speed = 500.0
	_score_delta_time = 0

func _ready():
	_ui_pause = $HUD/Pause
	_ui_hearts = [$HUD/Hearts/heart1, $HUD/Hearts/heart2, $HUD/Hearts/heart3]
	_ui_score = $HUD/Score
	
	update_hearts_ui()
	
func _process(delta: float):
	# Increase score
	_score_delta_time -= delta
	if _score_delta_time <= 0:
		_score += 1
		_ui_score.text = "Score: %d" % _score
		_score_delta_time = SCORE_INCREASE_COOLDOWN
	
	# Update scrolling speed
	_speed += (delta * SPEED_MULTIPLIER)
	# TBD: Update background scrolling speeds


func DecreaseHealth():
	_health -= 1
	if _health <= 0:
		print("tbd: Game Over")
	else:
		update_hearts_ui()
	
func IncreaseHealth():
	if _health < 3:
		_health += 1
		update_hearts_ui()
	
func update_hearts_ui():
	_ui_hearts[0].visible = (_health >= 1)
	_ui_hearts[1].visible = (_health >= 2)
	_ui_hearts[2].visible = (_health >= 3)


func _on_Pause_pressed():
	pass # Replace with function body.
