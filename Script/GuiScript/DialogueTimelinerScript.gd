extends Area2D

var Can_talk=false
onready var PlayerDialogue=Dialogic
onready var Player=get_parent().get_parent().get_node("Tics")
onready var PlayerDialogueHolder=get_parent().get_parent().get_node("Tics/DialogueHolder")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
var DialogueOn=false
export (String) var timeline
export var oneShot=false
export var parentOneShot=false
export var canWork=true

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
		if Input. is_action_just_pressed("Action Key Q") and Can_talk==true and DialogueOn==false and Player.dialogueOn==false and canWork==true:
			PlayerDialogueHolder.NewDialogue(timeline)
			get_parent().get_parent().get_parent().get_node("YSort/Tics").indicatorInvisible()
			if oneShot==true:
				queue_free()
			if parentOneShot==true:
				get_parent().queue_free()
			

func _on_DialogueTimeliner_body_entered(body):
	if body.get_name()=='Tics'and DialogueOn==false:
		Can_talk=true
		body.indicatorVisible()

func _on_DialogueTimeliner_body_exited(body):
	if body.get_name()=='Tics':
		Can_talk=false
		body.indicatorInvisible()
