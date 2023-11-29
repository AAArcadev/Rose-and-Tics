extends ColorRect

func _physics_process(_delta):
	$HealthGui.play(String(get_parent().get_parent().Health))
