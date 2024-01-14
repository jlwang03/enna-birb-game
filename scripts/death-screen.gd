extends Control

export(Array, Texture) var _texture
export(Array, Vector2) var _texture_position


func OpenScreen(score: int):
	# Global calls - Stop running and update highest scores
	Global.SetIsRunning(false)
	if score > Global._highestScore:
		Global._highestScore = score
	
	# Update UI
	var i = randi() % _texture.size()
	$enna.texture = _texture[i]
	$enna.rect_position = _texture_position[i]
	$score.text = "Distance: %d" % score
	show()
