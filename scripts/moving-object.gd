extends KinematicBody2D

class_name MovingObject

const START_POS: Vector2 = Vector2(1600.0, 700.0)
const SPEED: float = -5.0

func _ready():
	# Set initial position
	position = START_POS

func _process(delta: float) -> void:
	# Hide object once it reaches the edge of the frame
	if (position.x < 0.0):
		DestroyObject()

func _physics_process(delta):
	# Check for collisions
	var collision_info = move_and_collide(Vector2(SPEED,0))
	if collision_info:
		collide_with_player()
		
func DestroyObject():
	set_process(false)
	hide()

# --- OVERRIDE ---
func collide_with_player():
	pass
