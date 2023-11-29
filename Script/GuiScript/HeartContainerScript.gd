extends Sprite

func _ready():
	$Timer.start()
	
func _on_Area2D_body_entered(body):
	if body.get_name()=='Tics' and body.Health<12:
		body.Health+=4
		MasterAudioController.get_node("HealthUp").play()
		queue_free()


func _on_Timer_timeout():
	$AnimationPlayer.play("Flash")

func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
