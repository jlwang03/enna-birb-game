extends Slideshow


onready var _tutorial_screen
export(Array, Texture) var _screens


func _ready():
	_tutorial_screen = $screen
	_total_screens = _screens.size()
	
	UpdateButtons()


func LoadScreen(index: int):
	_tutorial_screen.set_texture(_screens[index])
	UpdateButtons()
