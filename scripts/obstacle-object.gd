extends MovingObject

class_name ObstacleObject

func collide_with_player():
	GameManager.DecreaseHealth()
