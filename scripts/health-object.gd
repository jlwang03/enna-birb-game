extends MovingObject

class_name HealthObject

func collide_with_player():
	GameManager.IncreaseHealth()
	DestroyObject()
