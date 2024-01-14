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


func _on_julitch_pressed():
	OS.shell_open("https://julwang.itch.io/")


func _on_cuppatinainsta_pressed():
	OS.shell_open("https://www.instagram.com/cuppatina.art")


func _on_cuppatinatwitter_pressed():
	OS.shell_open("https://twitter.com/cuppatina_art")


func _on_ghoustinsta_pressed():
	OS.shell_open("https://www.instagram.com/ghoustboi")


func _on_ghousttwitter_pressed():
	OS.shell_open("https://twitter.com/ghoustboi_laine")
