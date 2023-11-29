extends Area2D

var Can_talk=false
onready var PlayerDialogue=Dialogic
onready var Player=get_parent().get_node("YSort/Tics")

export var LilianBook=false
export var geraldsBookMine=false
export var geraldsBookRuin=false
export var RileysBook=false


var DialogueOn=false
export (String) var timeline

func _physics_process(_delta):
		if Input. is_action_just_pressed("Action Key Q") and Can_talk==true and DialogueOn==false and LilianBook==true:
			Player.get_node("CanvasLayer/BookText").LiliansBook()
		if Input. is_action_just_pressed("Action Key Q") and Can_talk==true and DialogueOn==false and geraldsBookMine==true:
			Player.get_node("CanvasLayer/BookText").GeraldsBookMine()
		if Input. is_action_just_pressed("Action Key Q") and Can_talk==true and DialogueOn==false and geraldsBookRuin==true:
			Player.get_node("CanvasLayer/BookText").GeraldsBookRuin()
		if Input. is_action_just_pressed("Action Key Q") and Can_talk==true and DialogueOn==false and RileysBook==true:
			Player.get_node("CanvasLayer/BookText").RileyBookCastle()
			Player.readRileys=true
		
func _on_BookTextTrigger_body_entered(body):
	if body.get_name()=='Tics':
		Can_talk=true

func _on_BookTextTrigger_body_exited(body):
	if body.get_name()=='Tics':
		Can_talk=false
