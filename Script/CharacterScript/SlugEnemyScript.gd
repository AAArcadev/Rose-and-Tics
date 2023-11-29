extends KinematicBody2D

export var speed=20
export var moving=false
export var health=1
export var surviveBee=true

export var follow_speed=33.5
var follow_distance=10
var follow_stop_distance=0
export var canFollow=true
onready var Roseline=get_parent().get_node("Roseline")

func _physics_process(delta):
	if moving==true:
		position += transform.x * speed * delta
	
		if speed<0:
			$AnimatedSprite.flip_h=false
		if speed>0:
			$AnimatedSprite.flip_h=true
	
	if health<=0:
		MasterAudioController.get_node("BeeDeath").play()
		Poof()
		HeartChance()
		queue_free()
		
	if surviveBee==true:
		follow(Roseline)
		$CollisionShape2D.disabled=true
		$SurviveEnemy/CollisionShape2D.disabled=false
		
		if Roseline.position.x>position.x:
			$AnimatedSprite.flip_h=true
		if Roseline.position.x<position.x:
			$AnimatedSprite.flip_h=false

func follow(whatToFollow):
	if global_position.distance_to(whatToFollow.global_position)>follow_distance and canFollow==true:
		var distance : Vector2=(whatToFollow.global_position-global_position)
		move_and_slide(follow_speed*distance.normalized())
	
func _on_Area2D_body_entered(body):
	if body.get_name()=="Tics":
		body.Damaged(1)
	if moving==true:
		speed=speed*-1

	
func Damage(damageNo):
	health-=damageNo


func _on_SurviveEnemy_body_entered(body):
		if body.get_name()=="Roseline":
			body.get_parent().Damage(1)
			queue_free()

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
	
