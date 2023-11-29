extends Position2D

var Can_talk=false


func _physics_process(_delta):
	if Input. is_action_just_pressed("Action Key Q") and Can_talk==true:
		rotation_degrees+=90

func _on_PlayerArea2D_body_entered(body):
	if body.get_name()=='Tics':
		Can_talk=true


func _on_PlayerArea2D_body_exited(body):
	if body.get_name()=='Tics':
		Can_talk=false

func _on_Reflector_area_entered(area):
	if area.get_name()=='ReflectorBullet':
		$ShootPosition.shoot()
	area.queue_free()

