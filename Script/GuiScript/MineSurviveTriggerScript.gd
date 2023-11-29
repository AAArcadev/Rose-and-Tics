extends Node2D

export var surviveOn=false

func eventTrigger():
	get_parent().get_node("RoseHealthLabel").visible=true
	get_parent().get_node("RoseHealthLabel/RoseHealthBar").value=25
	get_parent().get_node("BeeSpawner2").SurviveSpawn()
	get_parent().get_node("BeeSpawner3").SurviveSpawn()
	get_parent().get_node("BeeSpawner4").SurviveSpawn()
	get_parent().get_node("BeeSpawner5").SurviveSpawn()
	get_parent().get_node("InvisibleBoundary/CollisionShape2D").disabled=false
	get_parent().get_node("InvisibleBoundary2/CollisionShape2D").disabled=false
	MasterAudioController.get_node("MineMusic").stop()
	MasterAudioController.get_node("MineSurviveMusic").play()
	surviveOn=true
	$Timer.start()

		
		
func _on_Timer_timeout():
	get_parent().get_node("RoseHealthLabel").visible=false
	get_parent().get_node("BeeSpawner2").queue_free()
	get_parent().get_node("BeeSpawner3").queue_free()
	get_parent().get_node("BeeSpawner4").queue_free()
	get_parent().get_node("BeeSpawner5").queue_free()
	get_parent().get_node("InvisibleBoundary").queue_free()
	get_parent().get_node("InvisibleBoundary2").queue_free()
	get_parent().get_parent().get_parent().get_node("YSort/Tics/MainAnimationPlayer").play("BeeSurviveEnd")
	MasterAudioController.get_node("MineMusic").play()
	MasterAudioController.get_node("MineSurviveMusic").stop()
	surviveOn=false
	queue_free()
