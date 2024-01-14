extends Node2D

class_name Slideshow

var _total_screens: int
var _screen_index: int


func Open():
	_screen_index = 0
	LoadScreen(_screen_index)
	show()


func _on_left_pressed():
	_screen_index = max(_screen_index - 1, 0)
	LoadScreen(_screen_index)


func _on_right_pressed():
	_screen_index = min(_screen_index + 1, _total_screens - 1)
	LoadScreen(_screen_index)


func _on_menu_pressed():
	hide()


func UpdateButtons():
	# Hide or show buttons
	if _screen_index <= 0:
		$"left-button".hide()
	else:
		$"left-button".show()
	if _screen_index >= (_total_screens - 1):
		$"right-button".hide()
	else:
		$"right-button".show()


# Function to override
func LoadScreen(index: int):
	pass
