extends Node2D

onready var _tutorial_screen
onready var _left_button
onready var _right_button

export(Array, Texture) var _screens
var _total_screens: int
var _screen_index: int


func _ready():
	_tutorial_screen = $screen
	_total_screens = _screens.size()
	_left_button = $"left-button"
	_left_button.show()
	_right_button = $"right-button"
	_right_button.show()
	
	_screen_index = 0
	LoadScreen(_screen_index)


func _on_left_pressed():
	_screen_index = max(_screen_index - 1, 0)
	LoadScreen(_screen_index)


func _on_right_pressed():
	_screen_index = min(_screen_index + 1, _total_screens - 1)
	LoadScreen(_screen_index)


func _on_menu_pressed():
	hide()


func LoadScreen(index: int):
	_tutorial_screen.set_texture(_screens[index])
	
	# Hide or show buttons
	if _screen_index <= 0:
		_left_button.hide()
	else:
		_left_button.show()
	if _screen_index >= (_total_screens - 1):
		_right_button.hide()
	else:
		_right_button.show()
