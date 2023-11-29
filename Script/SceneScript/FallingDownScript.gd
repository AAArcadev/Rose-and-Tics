extends Node2D


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scene/MainWorld.tscn")
	MasterAudioController.get_node("OpeningMusic").stop()

func thump():
	MasterAudioController.get_node("Thump").play()
