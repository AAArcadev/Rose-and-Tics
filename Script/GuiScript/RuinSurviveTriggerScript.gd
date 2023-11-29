extends Node2D
		
func eventTrigger():
	get_parent().get_node("WombatSpawner2").SurviveSpawn()
	get_parent().get_node("WombatSpawner3").SurviveSpawn()
	get_parent().get_node("WombatSpawner4").SurviveSpawn()
	get_parent().get_node("WombatSpawner5").SurviveSpawn()
	get_parent().get_node("InvisibleBarrier/CollisionShape2D").disabled=false
	get_parent().get_node("InvisibleBarrier2/CollisionShape2D").disabled=false
	MasterAudioController.get_node("ElevatorMusic").play()
	MasterAudioController.get_node("RuinMusic").stop()
	$Timer.start()


func _on_Timer_timeout():
	get_parent().get_node("WombatSpawner2").queue_free()
	get_parent().get_node("WombatSpawner3").queue_free()
	get_parent().get_node("WombatSpawner4").queue_free()
	get_parent().get_node("WombatSpawner5").queue_free()
	get_parent().get_node("AnimationPlayer").play("Docking")
	MasterAudioController.get_node("ElevatorMusic").stop()
	MasterAudioController.get_node("RuinMusic").play()
	queue_free()
	
	
