extends Node2D


const SPEED_MULTIPLIER: float = 0.1
const SCORE_INCREASE_COOLDOWN: float = 0.0
const ENEMY_SPAWN_COOLDOWN: float = 2.5
const HEALTH_SPAWN_COOLDOWN: float = 10.0

onready var _ui_pause
onready var _ui_hearts
onready var _ui_score
onready var _menu
onready var _menu_score
onready var _death_screen

var _score
var _health
var _speed

onready var _spawner
onready var _bg
onready var _enna_ID

var _score_delta_time: float
var _enemy_delta_time: float
var _health_delta_time: float

func _init():
	_score = 0
	_health = 3
	_speed = 6.0
	_score_delta_time = 0
	_enemy_delta_time = 0
	_health_delta_time = HEALTH_SPAWN_COOLDOWN

func _ready():
	_ui_pause = $HUD/pause
	_ui_hearts = [$HUD/Hearts/heart1, $HUD/Hearts/heart2, $HUD/Hearts/heart3]
	_ui_score = $HUD/Score
	update_hearts_ui()
	
	_menu = $Menu
	_menu_score = $Menu/Screen/score
	_menu.hide()
	_death_screen = $DeathScreen
	_death_screen.hide()
	
	_spawner = $Spawner
	_bg = $ParallaxBackground
	_bg.SetSpeed(_speed)
	_enna_ID = $Enna.get_instance_id()
	
func _process(delta: float):
	CheckForKeyPress()
	
	if Global.IsRunning():
		# Increase score
		_score_delta_time -= delta
		if _score_delta_time <= 0:
			_score += 1
			_ui_score.text = "Distance: %dm" % _score
			_score_delta_time = SCORE_INCREASE_COOLDOWN
		
		# Spawn enemy
		_enemy_delta_time -= delta
		if _enemy_delta_time <= 0:
			_spawner.SpawnEnemy(_speed)
			_enemy_delta_time = rand_range(1.0, ENEMY_SPAWN_COOLDOWN)
		
		# Spawn health item
		_health_delta_time -= delta
		if _health_delta_time <= 0:
			_spawner.SpawnHealth(_speed)
			_health_delta_time = rand_range(5.0, HEALTH_SPAWN_COOLDOWN)
		
		# Update scrolling speed
		_speed += (delta * SPEED_MULTIPLIER)
		_bg.SetSpeed(_speed)


func CheckForKeyPress():
	if Input.is_action_just_pressed("escape"):
		if Global.IsRunning():
			_on_pause_pressed()
		else:
			_on_resume_pressed()


func DecreaseHealth():
	_health -= 1
	if _health <= 0:
		_death_screen.OpenScreen(_score)
	update_hearts_ui()


func IncreaseHealth():
	if _health < 3:
		_health += 1
		update_hearts_ui()


func update_hearts_ui():
	_ui_hearts[0].visible = (_health >= 1)
	_ui_hearts[1].visible = (_health >= 2)
	_ui_hearts[2].visible = (_health >= 3)


func _on_pause_pressed():
	Global.SetIsRunning(false)
	_menu.show()
	_menu_score.text = "Score: %d" % _score


func _on_resume_pressed():
	Global.SetIsRunning(true)
	_menu.hide()


func _on_restart_pressed():
	Global.StartGame()


func _on_menu_pressed():
	Global.GameOver(0)


func _on_quit_pressed():
	get_tree().quit()
