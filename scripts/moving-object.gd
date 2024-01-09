extends KinematicBody2D

class_name MovingObject

const SPEED_MULTIPLIER: float = 2.25

onready var _gameManager

var _start_pos: Vector2
var _velocity: Vector2
var _has_collided: bool

func initialize(start_y: float = 425.0, speed: float = 12):
	_start_pos = Vector2(1100.0, start_y)
	_velocity = Vector2(speed * (-1) * SPEED_MULTIPLIER, 0)
	_has_collided = false

func _ready():
	_gameManager = get_parent().get_parent()
	position = _start_pos

func _process(delta: float) -> void:
	if Global.IsRunning():
		# Hide object once it reaches the edge of the frame
		if (position.x < (_start_pos.x * (-1))):
			DestroyObject()

func _physics_process(delta):
	if Global.IsRunning():
		# Check for collisions
		var collision_info = move_and_collide(_velocity)
		
		if collision_info and (collision_info.collider_id == _gameManager._enna_ID) and not _has_collided:
			_has_collided = true
			collide_with_player()
		
func DestroyObject():
	self.queue_free()

# --- OVERRIDE ---
func collide_with_player():
	pass
