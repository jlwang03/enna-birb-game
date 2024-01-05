extends MovingObject

class_name ObstacleObject

func collide_with_player():
	_gameManager.DecreaseHealth()
	DestroyObject()
