extends ColorRect



func _on_ContinueButton_pressed():
	if visible==true and get_tree().paused==true:
		get_tree().paused=false
		visible=!visible
		$GiveUpButton/WarningHolder.visible=false


func _on_GiveUpButton_pressed():
	if visible==true and get_tree().paused==true and $GiveUpButton/WarningHolder.visible==false:
		$GiveUpButton/WarningHolder.visible=!$GiveUpButton/WarningHolder.visible
	if visible==true and get_tree().paused==true and $GiveUpButton/WarningHolder.visible==true:
		get_tree().quit()
