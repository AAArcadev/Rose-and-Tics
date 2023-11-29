extends Node2D

func _on_ExitButton_pressed():
		get_tree().quit()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scene/FallingDown.tscn")

func _ready():
	MasterAudioController.get_node("OpeningMusic").play()
