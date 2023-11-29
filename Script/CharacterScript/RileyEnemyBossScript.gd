extends KinematicBody2D

export var stage1Var=true
export var stage2Var=false
export var stage3Var=false

export var shielded=false

export var Health=45

func _physics_process(_delta):
	get_parent().get_node("RileyHealthLabel/TextureProgress").value=Health
	if get_parent().get_parent().get_parent().get_node("YSort/Tics").rileySkeleton>=5:
		shielded=false
		
	if shielded==true:
		$RileyShield.visible=true
	else:
		$RileyShield.visible=false
		
	if Health==30:
		stage2()
		Health=29
	
	if Health==15:
		stage3()
		Health=14
	
	if Health==0:
		Health=1
		get_parent().get_node("RileyBossFightManager").end()
	
	if get_parent().get_parent().get_parent().get_node("YSort/Tics").global_position.x>global_position.x:
		$AnimatedSprite.flip_h=true
	if get_parent().get_parent().get_parent().get_node("YSort/Tics").global_position.x<global_position.x:
		$AnimatedSprite.flip_h=false
		
func stage1():
	$SummonTimer.start()
	summon()
	shielded=true

func summon():
	if stage1Var==true:
		get_parent().get_node("SkeletonSpawner").summonSpawn()
		get_parent().get_node("SkeletonSpawner2").summonSpawn()
		get_parent().get_node("SkeletonSpawner3").summonSpawn()
		get_parent().get_node("SkeletonSpawner4").summonSpawn()
		get_parent().get_node("SkeletonSpawner5").summonSpawn()
		$AnimatedSprite.play("RaiseDead")
		get_parent().get_parent().get_parent().get_node("YSort/Tics").rileySkeleton=0
		$SummonShootNode.shoot()
		$SummonShootTimer.start()
		
	if stage3Var==true:
		get_parent().get_node("SkeletonSpawner").summonSpawn()
		get_parent().get_node("SkeletonSpawner2").summonSpawn()
		get_parent().get_node("SkeletonSpawner3").summonSpawn()
		get_parent().get_node("SkeletonSpawner4").summonSpawn()
		get_parent().get_node("SkeletonSpawner5").summonSpawn()
		$AnimatedSprite.play("RaiseDead")
		get_parent().get_parent().get_parent().get_node("YSort/Tics").rileySkeleton=0

	shielded=true

func _on_SummonTimer_timeout():
	summon()
	get_parent().get_parent().get_parent().get_node("YSort/Tics").rileySkeleton=0
	
func _on_SummonShootTimer_timeout():
	$SummonShootNode.shoot()
	$SummonShootTimer.start()
	
	
func stage2():
	$AnimationPlayer.play("Teleport")
	$SummonTimer.stop()
	stage1Var=false
	stage2Var=true
	shielded=false


func _on_ShootTimer_timeout():
	$AnimationPlayer.play("Teleport")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="Teleport":
		position.x=rand_range(12,116)
		position.y=rand_range(12,116)
		$AnimationPlayer.play("TeleportReverse")
	if anim_name=="TeleportReverse":
		$SummonShootNode.shoot()
		$ShootTimer.start()
		if stage3Var==true:
			summon()


func rileyLaugh():
	$AnimatedSprite.play("Laugh")


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("Idle")

func Damage(damageNo):
	if shielded==false:
		Health-=damageNo
		$FlashAnimationPlayer.play("Flash")
	
func stage3():
	$AnimationPlayer.play("Teleport")
	stage1Var=false
	stage2Var=false
	stage3Var=true
	shielded=true

func death():
	$AnimatedSprite.play("Death")
	shielded=false
	$DeathTimer.start()
	
	
func _on_DeathTimer_timeout():
	queue_free()
