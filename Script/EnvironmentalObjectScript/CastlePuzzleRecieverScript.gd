extends AnimatedSprite

func _on_CastlePuzzleRecieverArea_area_entered(area):
	if area.get_name()=='ReflectorBullet':
		get_parent().get_node("CastlePuzzle").end()
		play("On")
