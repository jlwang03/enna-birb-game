extends PhysicsBody2D

class_name Enna

enum State {
	RUNNING,
	JUMP,
	DIVE
}

var health: int
var current_state
var is_animation_finished: bool

func _init():
	current_state = State.RUNNING
	is_animation_finished = false

func _ready():
	enna_run()

func _process(delta: float):
	match current_state:
		State.RUNNING:
			if Input.is_action_just_pressed("ui_up"):
				enna_jump()
			elif Input.is_action_just_pressed("ui_down"):
				enna_dive()
			pass
		State.JUMP:
			if is_animation_finished:
				if Input.is_action_pressed("ui_up"):
					enna_jump()
				elif Input.is_action_pressed("ui_down"):
					enna_dive()
				else:
					enna_run()
			pass
		State.DIVE:
			if is_animation_finished:
				if not Input.is_action_pressed("ui_down"):
					enna_run()
				else:
					enna_slide()
			pass


# Functions related to state and animations
func enna_run() -> void:
	current_state = State.RUNNING
	is_animation_finished = false
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("run")

func enna_jump() -> void:
	current_state = State.JUMP
	is_animation_finished = false
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("jump")

func enna_dive() -> void:
	current_state = State.DIVE
	is_animation_finished = false
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("dive")

func enna_slide() -> void:
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("slide")

func _on_AnimationPlayer_animation_finished(anim_name):
	is_animation_finished = true
