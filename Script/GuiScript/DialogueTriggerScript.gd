extends Area2D

export var timelineName="null"

export var needsRiley=false

func _on_DialogueTrigger_body_entered(body):
	if body.get_name()=="Tics" and needsRiley==false:
		get_parent().get_node("YSort/Tics/DialogueHolder").NewDialogue(timelineName)
		queue_free()
	if body.get_name()=="Tics" and needsRiley==true and get_parent().get_node("YSort/Tics").readRileys==true:
		get_parent().get_node("YSort/Tics/DialogueHolder").NewDialogue(timelineName)
		queue_free()
