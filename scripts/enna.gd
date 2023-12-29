extends KinematicBody2D

enum State {
	RUNNING,
	JUMP,
	DIVE
}

var current_state = State.RUNNING
var time_in_state = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	_enna_run()

func _physics_process(delta: float):
	time_in_state += delta
	
	match current_state:
		State.RUNNING:
			if Input.is_action_pressed("ui_up"):
				_enna_jump()
			elif Input.is_action_pressed("ui_down"):
				_enna_dive()
			pass
		State.JUMP:
			if time_in_state > 0.8:
				_enna_run()
			pass
		State.DIVE:
			if time_in_state > 0.5 and not Input.is_action_pressed("ui_down"):
				_enna_run()
			pass
	
func _enna_run() -> void:
	current_state = State.RUNNING
	time_in_state = 0.0
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("run")

func _enna_jump() -> void:
	current_state = State.JUMP
	time_in_state = 0.0
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("jump")

func _enna_dive() -> void:
	current_state = State.DIVE
	time_in_state = 0.0
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("dive")
