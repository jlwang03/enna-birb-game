extends ParallaxBackground

const SCROLLING_MULTIPLIER: float = 100.0

var _speed

func SetSpeed(speed):
	_speed = speed

func _process(delta):
	self.scroll_base_offset -= (Vector2(_speed * SCROLLING_MULTIPLIER, 0) * delta)
