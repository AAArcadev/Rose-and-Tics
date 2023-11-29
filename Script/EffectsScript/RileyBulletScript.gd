extends Area2D

var speed = 20
export var damageNo=1
func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_RileyBullet_body_entered(body):
	if 'Tics' in body.name:
		body.Damaged(damageNo)
	if  body.get_name()!='RileyEnemyBoss':
		queue_free()
	Poof()
		
export (PackedScene) var PoofVar

func Poof():
	var b = PoofVar.instance()
	get_parent().add_child(b)
	b.transform = transform
