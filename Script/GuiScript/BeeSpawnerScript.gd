extends Position2D

export (PackedScene) var Bee
export var spawnV=false
export var spawnH=false

func _physics_process(_delta):
	if get_parent().get_node("MineSurviveTrigger/Timer").time_left<=40:
		$TimerH.wait_time=4
	if get_parent().get_node("MineSurviveTrigger/Timer").time_left<=20:
		$TimerH.wait_time=2
	
func spawn():
	var b = Bee.instance()
	get_parent().add_child(b)
	b.transform = transform

func SurviveSpawn():
	if spawnH==true:
		$TimerH.start()
	if spawnV==true:
		$TimerV.start()
	
func _on_TimerH_timeout():
	position.x=rand_range(4,124)
	spawn()
	$TimerH.start()

func _on_TimerV_timeout():
	position.y=rand_range(4,124)
	spawn()
	$TimerV.start()
