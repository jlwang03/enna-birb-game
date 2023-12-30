extends Sprite


const SPEED: float = -500.0
var texture_width: float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	texture_width = texture.get_size().x * scale.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += SPEED * delta
	_attempt_reposition()

func _attempt_reposition() -> void:
	if position.x < -texture_width:
		position.x += (2 * texture_width - 50.0)
