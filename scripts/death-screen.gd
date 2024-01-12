extends Control


func OpenScreen(score: int):
	Global.SetIsRunning(false)
	
	if score > Global._highestScore:
		Global._highestScore = score
	
	$score.text = "Score: %d" % score
	show()
