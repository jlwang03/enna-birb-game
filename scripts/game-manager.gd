extends Node2D

const SPEED_MULTIPLIER: float = 1.0
const SCORE_INCREASE_COOLDOWN: float = 1.0

onready var _enna
var _score
var _health
var _speed

var _score_delta_time

func _init():
	_enna = $Enna
	_score = 0
	_health = 3
	_speed = 500.0
	_score_delta_time = SCORE_INCREASE_COOLDOWN
	
func _process(delta: float) -> void:
	# Increase score
	_score_delta_time -= delta
	if _score_delta_time < 0:
		_score += 1
		_score_delta_time = SCORE_INCREASE_COOLDOWN
	
	# Update scrolling speed
	_speed += (delta * SPEED_MULTIPLIER)
	# TBD: Update background scrolling speeds


func DecreaseHealth():
	_health -= 1
	if _health <= 0:
		print("Game Over")
	
func IncreaseHealth():
	if _health < 3:
		_health += 1
	
