extends Position2D

export (PackedScene) var Bullet

func shoot():
	var b = Bullet.instance()
	get_parent().get_parent().add_child(b)
	b.transform = transform
