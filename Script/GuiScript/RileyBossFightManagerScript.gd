extends Node2D

var stageStarted=false
func eventTrigger():
	get_parent().get_node("RileyHealthLabel").visible=true
	get_parent().get_node("RileyEnemyBoss").stage1()
	get_parent().get_node("InvisibleBarrier/CollisionShape2D").disabled=false
	MasterAudioController.get_node("CastleMusic").stop()
	MasterAudioController.get_node("BossMusic").play()

func end():
	get_parent().get_node("RileyHealthLabel").visible=false
	MasterAudioController.get_node("BossMusic").stop()
	get_parent().get_node("RileyEnemyBoss").death()
	get_parent().get_parent().get_parent().get_node("YSort/GreatSeed2").visible=true
	get_parent().get_parent().get_parent().get_node("YSort/GreatSeed2/StaticBody2D/CollisionShape2D").disabled=false
	get_parent().get_parent().get_parent().get_node("YSort/GreatSeed2/DialogueTimeliner").canWork=true
	get_parent().get_parent().get_parent().get_node("YSort/Tics/DialogueHolder").NewDialogue("RileyBossEnd")
