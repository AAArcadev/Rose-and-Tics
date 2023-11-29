extends AnimatedSprite

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	if get_parent().get_node("CastlePuzzle").puzzleDone==false:
		$Position2D.shoot()
		$Timer.start()
