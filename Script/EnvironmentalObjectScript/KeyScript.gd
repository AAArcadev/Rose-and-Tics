extends Sprite

var Can_Get=false

func _physics_process(_delta):
		if Input. is_action_just_pressed("Action Key Q") and Can_Get==true:
			get_parent().get_parent().get_node("YSort/Tics").hasKey=true
			MasterAudioController.get_node("PickUpkey").play()
			get_parent().get_parent().get_node("YSort/Tics").indicatorInvisible()
			queue_free()

func _on_Area2D_body_entered(body):
	if body.get_name()=='Tics':
		Can_Get=true
		body.indicatorVisible()

func _on_Area2D_body_exited(body):
	if body.get_name()=='Tics':
		Can_Get=false
		body.indicatorInvisible()
