extends Area2D

var speed = 20

func _physics_process(delta):
	position += transform.x * speed * delta
	




func _on_ReflectorBullet_body_entered(body):
	if body.get_name()!='Tics':
		queue_free()
