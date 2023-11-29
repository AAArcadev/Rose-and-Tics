extends KinematicBody2D

export var movespeed = 40
export var dialogueOn=false
export var Health=12
export var greatSeedNo=0
export var weaponEquiped=0
export var hasKey=false
export var hasRose=false

export var invincible=false
export var readRileys=false

export var rileySkeleton=0

func _physics_process(_delta):
	var motion = Vector2()
	if Input. is_action_pressed("ui_up") and dialogueOn==false:
		motion.y-=10
		if hasRose==false:
			$Tics.play("Move")
		if hasRose==true:
			$Tics.play("MoveRose")

	if Input. is_action_pressed("ui_down") and dialogueOn==false:
		motion.y+=10
		if hasRose==false:
			$Tics.play("Move")
		if hasRose==true:
			$Tics.play("MoveRose")


	if Input. is_action_pressed("ui_right") and dialogueOn==false:
		motion.x+=10
		$Tics.flip_h=true
		if hasRose==false:
			$Tics.play("Move")
		if hasRose==true:
			$Tics.play("MoveRose")

		
	if Input. is_action_pressed("ui_left") and dialogueOn==false:
		motion.x-=10
		$Tics.flip_h=false
		if hasRose==false:
			$Tics.play("Move")
		if hasRose==true:
			$Tics.play("MoveRose")

	motion = motion.normalized()
	motion = move_and_slide(motion*movespeed)
	
	if not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_right")  and not Input.is_action_pressed("ui_left"):
		if hasRose==false:
			$Tics.play("Idle")
		if hasRose==true:
			$Tics.play("IdleRose")
			
	if hasKey==true:
		$CanvasLayer/GUIBackHolder/Key.visible=true
	else:
		$CanvasLayer/GUIBackHolder/Key.visible=false
		
	if $CanvasLayer/BookText.bookUsed==false and Input.is_action_just_pressed("Escape"):
		get_tree().paused=true
		$CanvasLayer/PauseScreen.visible=true
		
	if Health<=0:
		invincible=true
		get_tree().paused=true
		$CanvasLayer/EndScreenHolder.visible=true
		Health=1
		
	if Health>12:
		Health=12
			
func Damaged(damageNo):
	if invincible==false:
		$CanvasLayer/GUIBackHolder/HealthGui.visible=true
		$CanvasLayer/GUIBackHolder/HealthGui/Timer.start()
		$FlashAnimationPlayer.play("Flash")
		MasterAudioController.get_node("TicsHurt").play()
		Health-=damageNo


func _on_Timer_timeout():
	$CanvasLayer/GUIBackHolder/HealthGui.visible=false

func indicatorVisible():
	$Indicator.visible=true
	
func indicatorInvisible():
	$Indicator.visible=false
