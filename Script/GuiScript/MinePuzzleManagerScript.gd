extends Node2D

var oneInPlane=false
var twoInPlane=false
var threeInPlane=false

func _on_StatuePlace3_body_entered(body):
	if body.get_name()=="MinePuzzleStatue3":
		threeInPlane=true
		print("done")

func _on_StatuePlace3_body_exited(body):
	if body.get_name()=="MinePuzzleStatue3":
		threeInPlane=false
		print("out")
		
func _on_StatuePlace2_body_entered(body):
	if body.get_name()=="MinePuzzleStatue2" or body.get_name()=="MinePuzzleStatue":
		twoInPlane=true
		print("done")

func _on_StatuePlace2_body_exited(body):
	if body.get_name()=="MinePuzzleStatue2"or body.get_name()=="MinePuzzleStatue":
		twoInPlane=false
		print("out")

func _on_StatuePlace1_body_entered(body):
	if body.get_name()=="MinePuzzleStatue" or body.get_name()=="MinePuzzleStatue2":
		oneInPlane=true
		print("done")

func _on_StatuePlace1_body_exited(body):
	if body.get_name()=="MinePuzzleStatue" or body.get_name()=="MinePuzzleStatue2":
		oneInPlane=false
		print("out")


func _physics_process(_delta):
	if oneInPlane==true and twoInPlane==true and threeInPlane==true:
		get_parent().get_node("Door").queue_free()
		MasterAudioController.get_node("DoorOpen").play()
		queue_free()
		twoInPlane=false
	
