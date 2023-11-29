extends Position2D

export (PackedScene) var Bee

func spawn():
	var b = Bee.instance()
	get_parent().add_child(b)
	b.transform = transform

func summonSpawn():
	position.x=rand_range(12,116)
	position.y=rand_range(12,116)
	spawn()

func _on_Area2D_body_entered(body):
	if  body.get_name()=='RileyEnemyBoss':
		position.x=rand_range(12,116)
		position.y=rand_range(12,116)
		if get_parent().get_node("RileyEnemyBoss").stage2Var==false:
			spawn()
