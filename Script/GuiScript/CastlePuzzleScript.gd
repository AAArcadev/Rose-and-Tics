extends Node2D

export var puzzleDone=false

func end():
	if puzzleDone==false:
		get_parent().get_node("Door4").queue_free()
		MasterAudioController.get_node("DoorOpen").play()
		puzzleDone=!puzzleDone
	
	
