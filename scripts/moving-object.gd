extends KinematicBody2D

class_name MovingObject

onready var _gameManager

var _start_pos: Vector2
var _velocity: Vector2
var _has_collided: bool

func _init(start_y: float = 500.0, speed: float = 9):
	_start_pos = Vector2(1100.0, start_y)
	_velocity = Vector2(speed * (-1), 0)
	_has_collided = false

func _ready():
	_gameManager = get_parent()
	position = _start_pos

func _process(delta: float) -> void:
	# Hide object once it reaches the edge of the frame
	if (position.x < (_start_pos.x * (-1))):
		print("destroy")
		DestroyObject()

func _physics_process(delta):
	# Check for collisions
	var collision_info = move_and_collide(_velocity)
	
	if collision_info and not _has_collided:
		_has_collided = true
		collide_with_player()
		
func DestroyObject():
	set_process(false)
	hide()

# --- OVERRIDE ---
func collide_with_player():
	pass
