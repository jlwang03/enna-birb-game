extends PhysicsBody2D

enum State {
	RUNNING,
	JUMP,
	DIVE
}

var current_state = State.RUNNING
var is_animation_finished = false


func _ready():
	_enna_run()

func _process(delta: float):
	match current_state:
		State.RUNNING:
			if Input.is_action_just_pressed("ui_up"):
				_enna_jump()
			elif Input.is_action_just_pressed("ui_down"):
				_enna_dive()
			pass
		State.JUMP:
			if is_animation_finished:
				_enna_run()
			pass
		State.DIVE:
			if is_animation_finished:
				if not Input.is_action_pressed("ui_down"):
					_enna_run()
				else:
					_enna_slide()
			pass

func _on_AnimationPlayer_animation_finished(anim_name):
	is_animation_finished = true		
	

func _enna_run() -> void:
	current_state = State.RUNNING
	is_animation_finished = false
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("run")

func _enna_jump() -> void:
	current_state = State.JUMP
	is_animation_finished = false
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("jump")

func _enna_dive() -> void:
	current_state = State.DIVE
	is_animation_finished = false
	
	$AnimationPlayer.stop()
	$AnimationPlayer.play("dive")

func _enna_slide() -> void:
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("dive")

func CollectBurrito() -> void:
	print("burrito")
