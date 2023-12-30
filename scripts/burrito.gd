extends StaticBody2D

const START_POS: Vector2 = Vector2(1600.0, 700.0)
const VELOCITY: float = -500.0

func _ready():
	# Set initial position
	position = START_POS

func _process(delta: float) -> void:
	position.x += VELOCITY * delta
	
	# Hide burrito once it reaches the edge of the frame
	if (position.x < 0.0):
		Destroy()

func Destroy():
	set_process(false)
	hide()
