extends CanvasLayer


func NewDialogue(timelinename):
	var PlayerDialogue=Dialogic.start(timelinename)
	PlayerDialogue.connect("dialogic_signal", self, "dialog_listener")
	add_child(PlayerDialogue)


func dialog_listener(string):
	match string:
		"potTransferAnim":
			get_parent().get_node("MainAnimationPlayer").play("potTransfer")
		"MineSurvive":
			get_parent().get_node("MainAnimationPlayer").play("BeeSurviveStart")
		"hasSword":
			get_parent().weaponEquiped=1
		"rileyLaugh":
			get_parent().get_node("MainAnimationPlayer").play("RileyLaugh")
			
