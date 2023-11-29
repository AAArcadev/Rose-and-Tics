extends Area2D

func _on_WombatElevatorTrigger_body_entered(body):
	if body.get_name()=='Tics':
		get_parent().get_node("AnimationPlayer").play("Leaving")
		get_parent().get_node("Platform/AnimationPlayer").play("Shake")
		queue_free()
