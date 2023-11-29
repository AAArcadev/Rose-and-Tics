extends Node2D

func _ready():
	$YSort/Tics/DialogueHolder.NewDialogue("RoseIntroduction")

func mineSurviveEnd():
	$YSort/Tics/DialogueHolder.NewDialogue("MineSurviveEnd")
