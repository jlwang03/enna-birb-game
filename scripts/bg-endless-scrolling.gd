extends ParallaxBackground

const SPEED: float = 6.0
const SCROLLING_MULTIPLIER: float = 100.0

func _process(delta):
	self.scroll_base_offset -= (Vector2(SPEED * SCROLLING_MULTIPLIER, 0) * delta)
