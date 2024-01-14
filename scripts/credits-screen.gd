extends Slideshow


onready var _screens


func _ready():
	_screens = $screens.get_children()
	_total_screens = $screens.get_child_count()
	
	UpdateButtons()


func LoadScreen(index: int):
	for i in _total_screens:
		if i == index:
			$screens.get_child(i).show()
		else:
			$screens.get_child(i).hide()
	
	UpdateButtons()
