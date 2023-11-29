extends AnimatedSprite

func _ready():
	play("Poof")

func _on_EnemyPoof_animation_finished():
	queue_free()
