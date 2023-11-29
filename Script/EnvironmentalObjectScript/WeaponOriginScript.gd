extends Position2D

export var dialogueOn=false
export var canDamage=false

func _physics_process(_delta):
	$Weapon.play(String(get_parent().weaponEquiped))
	if Input. is_action_just_pressed("LeftMouseButton") and get_parent().dialogueOn==false and get_parent().weaponEquiped==1:
		$Weapon/AnimationPlayer.play("SwordAnim")
		look_at(get_global_mouse_position())

func _on_SwordDamageArea_body_entered(body):
	if 'Enemy' in body.name:
		body.Damage(1)
		MasterAudioController.get_node("SwordHit").play()
		
func _on_SwordDamageArea_area_entered(area):
	if 'SurviveEnemy' in area.name:
		area.Damage(1)
