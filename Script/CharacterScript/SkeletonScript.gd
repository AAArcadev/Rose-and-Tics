extends KinematicBody2D

export var speed=15
export var moving=true
export var health=1

export var bossFightSkeleton=true

func _ready():
	$SkeletonEnemy.play("Raise")

func _physics_process(delta):
	if moving==true:
		position += transform.x * speed * delta
		$SkeletonEnemy.play("Move")
		
		if speed<0:
			$SkeletonEnemy.flip_h=true
		if speed>0:
			$SkeletonEnemy.flip_h=false
			
		
	if bossFightSkeleton==true:
		moving=false

	if health<=0 and bossFightSkeleton==false:
		MasterAudioController.get_node("SkeletonDeath").play()
		Poof()
		HeartDrop()
		queue_free()
		
	if health<=0 and bossFightSkeleton==true:
		MasterAudioController.get_node("SkeletonDeath").play()
		get_parent().get_parent().get_parent().get_node("YSort/Tics").rileySkeleton+=1
		Poof()
		HeartDrop()
		queue_free()

func Damage(damageNo):
	health-=damageNo


func _on_SkeletonEnemy_animation_finished():
	if $SkeletonEnemy.animation=="Raise":
		$SkeletonEnemy.play("Idle")

export (PackedScene) var PoofVar

func Poof():
	var b = PoofVar.instance()
	get_parent().add_child(b)
	b.transform = transform

export (PackedScene) var HeartVar

func HeartDrop():
	var b = HeartVar.instance()
	get_parent().add_child(b)
	b.transform = transform
	
func HeartChance():
	if rand_range(0,10)>7:
		HeartDrop()
	else:
		pass


func _on_SkeletonEnemyArea_body_entered(body):
	if body.get_name()=="Tics":
		body.Damaged(1)
	if moving==true:
		speed=speed*-1
	if body.get_name()=='RileyEnemyBoss':
		queue_free()

