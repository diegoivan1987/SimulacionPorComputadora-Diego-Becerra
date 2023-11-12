extends Label
	
func _process(delta):
	text = "Time: " + str(round(Game.time))
