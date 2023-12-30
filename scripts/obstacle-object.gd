extends MovingObject

class_name ObstacleObject

var _has_collided: bool

func _init(start_y: float = 700.0, speed: float = -5).(start_y, speed):
	_has_collided = false

func collide_with_player():
	if not _has_collided:
		print("tbd: decrease health")
		_has_collided = true
