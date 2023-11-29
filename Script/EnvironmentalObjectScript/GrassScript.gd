extends AnimatedSprite

func _on_Area2D_body_entered(body):
	if body.get_name()=='Tics':
		play("Open")

func _on_Area2D_body_exited(body):
	if body.get_name()=='Tics':
		play("Close")
