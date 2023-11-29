extends Node2D

export var area1CanMove=false
export var area2CanMove=false

onready var Player=get_parent().get_parent().get_node("Tics")

func _physics_process(_delta):
	if Input. is_action_just_pressed("Action Key Q") and area1CanMove==true and Player.dialogueOn==false:
		Player.position=$AreaTransport2.global_position
		
	if Input. is_action_just_pressed("Action Key Q") and area2CanMove==true and Player.dialogueOn==false:
		Player.position=$AreaTransport1.global_position
		
func _on_AreaTransport1_body_entered(body):
	if body.get_name()=='Tics'and body.dialogueOn==false:
		area1CanMove=true
		body.indicatorVisible()


func _on_AreaTransport1_body_exited(body):
	if body.get_name()=='Tics'and body.dialogueOn==false:
		area1CanMove=false
		body.indicatorInvisible()


func _on_AreaTransport2_body_entered(body):
	if body.get_name()=='Tics'and body.dialogueOn==false:
		area2CanMove=true
		body.indicatorVisible()


func _on_AreaTransport2_body_exited(body):
	if body.get_name()=='Tics'and body.dialogueOn==false:
		area2CanMove=false
		body.indicatorInvisible()
