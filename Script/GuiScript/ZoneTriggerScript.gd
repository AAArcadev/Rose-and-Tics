extends Area2D

func _on_ZoneTrigger_body_entered(body):
	if body.get_name()=='Tics':
		get_parent().get_node("CanvasLayer/TransitionRect/AnimationPlayer").play("FadeIn")
		get_parent().get_node("MainCamera").current=true
		

func _on_ZoneTrigger_body_exited(body):
		if body.get_name()=='Tics':
			get_parent().get_node("MainCamera").current=false
