extends AnimationPlayer

func masterPlayer(animName):
	play(animName[0])
	print("Play")
	

func _on_MainAnimationPlayer_animation_started(_anim_name):
	get_parent().dialogueOn=true
	
func _on_MainAnimationPlayer_animation_finished(_anim_name):
	get_parent().dialogueOn=false
