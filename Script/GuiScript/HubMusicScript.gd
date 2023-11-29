extends Node2D

export var MineVar=false
export var RuinVar=false
export var CastleVar=false
export var homeVar=false

func _on_ZoneTrigger_body_entered(body):
	if body.get_name()=='Tics':
		if homeVar==true and MasterAudioController.get_node("HomeMusic").playing==false:
			MasterAudioController.get_node("HomeMusic").play()
			MasterAudioController.get_node("MineMusic").stop()
			MasterAudioController.get_node("CastleMusic").stop()
			MasterAudioController.get_node("RuinMusic").stop()
		if MineVar==true and MasterAudioController.get_node("MineMusic").playing==false:
			MasterAudioController.get_node("MineMusic").play()
			MasterAudioController.get_node("HomeMusic").stop()
			MasterAudioController.get_node("RuinMusic").stop()
		if CastleVar==true and MasterAudioController.get_node("CastleMusic").playing==false:
			MasterAudioController.get_node("CastleMusic").play()
			MasterAudioController.get_node("HomeMusic").stop()
			MasterAudioController.get_node("RuinMusic").stop()
		if RuinVar==true and MasterAudioController.get_node("RuinMusic").playing==false:
			MasterAudioController.get_node("RuinMusic").play()
			MasterAudioController.get_node("HomeMusic").stop()
			MasterAudioController.get_node("MineMusic").stop()
			MasterAudioController.get_node("CastleMusic").stop()


		
			
