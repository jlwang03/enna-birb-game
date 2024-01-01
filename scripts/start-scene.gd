extends Control

onready var main_scene

func _init():
	#main_scene = preload("res://scenes/main-scene.tscn").instantiate()
	pass

func _on_start_pressed():
	get_tree().change_scene("res://scenes/main-scene.tscn")


func _on_leaderboard_pressed():
	pass # Replace with function body.


func _on_credits_pressed():
	pass # Replace with function body.
