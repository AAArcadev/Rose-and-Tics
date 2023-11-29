extends AnimatedSprite

var Can_talk=false
onready var Player=get_parent().get_parent().get_parent().get_node("YSort/Tics")

func _physics_process(_delta):
		if Input. is_action_just_pressed("Action Key Q") and Can_talk==true and Player.dialogueOn==false:
			Player.Damaged(6)
			play("trap")
			

func _on_Area2D_body_entered(body):
	if body.get_name()=='Tics':
		Can_talk=true

func _on_Area2D_body_exited(body):
	if body.get_name()=='Tics':
		Can_talk=false
