extends MovingObject

class_name HealthObject

func collide_with_player():
	_gameManager.IncreaseHealth()
	DestroyObject()
