extends KinematicBody2D

class_name MovingObject

var _start_pos: Vector2
var _velocity: Vector2

func _init(start_y: float = 700.0, speed: float = -5):
	_start_pos = Vector2(1600.0, start_y)
	_velocity = Vector2(speed, 0)

func _ready():
	# Set initial position
	position = _start_pos

func _process(delta: float) -> void:
	# Hide object once it reaches the edge of the frame
	if (position.x < 0.0):
		DestroyObject()

func _physics_process(delta):
	# Check for collisions
	var collision_info = move_and_collide(_velocity)
	if collision_info:
		collide_with_player()
		
func DestroyObject():
	set_process(false)
	hide()

# --- OVERRIDE ---
func collide_with_player():
	pass
