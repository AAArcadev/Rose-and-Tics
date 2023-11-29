extends ColorRect

export var bookUsed=false

func GeraldsBookMine():
	visible=true
	$GeraldsBookMine.visible=true
	bookUsed=true
	get_parent().get_parent().dialogueOn=true

func RileyBookCastle():
	visible=true
	$RileyBookCastle.visible=true
	bookUsed=true
	get_parent().get_parent().dialogueOn=true
	
func LiliansBook():
	visible=true
	$LiliansBook.visible=true
	bookUsed=true
	get_parent().get_parent().dialogueOn=true
	
func GeraldsBookRuin():
	visible=true
	$GeraldsBookRuin.visible=true
	bookUsed=true
	get_parent().get_parent().dialogueOn=true
	
func _physics_process(_delta):
	if bookUsed==true and Input.is_action_just_pressed("Escape"):
		visible=false
		$GeraldsBookMine.visible=false
		$GeraldsBookRuin.visible=false
		$LiliansBook.visible=false
		$RileyBookCastle.visible=false
		bookUsed=!bookUsed
		get_parent().get_parent().dialogueOn=false
	
