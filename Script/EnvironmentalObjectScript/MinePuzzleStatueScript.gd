extends KinematicBody2D

var DialogueOn=false
var North_Can_move=false
var South_Can_move=false
var East_Can_move=false
var West_Can_move=false

var North_Cant_move=false
var South_Cant_move=false
var East_Cant_move=false
var West_Cant_move=false

func _physics_process(_delta):
	if Input. is_action_just_pressed("Action Key Q") and North_Can_move==true and DialogueOn==false and South_Cant_move==false:
		position.y+=8
	if Input. is_action_just_pressed("Action Key Q") and South_Can_move==true and DialogueOn==false and North_Cant_move==false:
		position.y-=8
	if Input. is_action_just_pressed("Action Key Q") and East_Can_move==true and DialogueOn==false and West_Cant_move==false:
		position.x-=8
	if Input. is_action_just_pressed("Action Key Q") and West_Can_move==true and DialogueOn==false and East_Cant_move==false:
		position.x+=8
			
func _on_NorthPushArea_body_entered(body):
	if body.get_name()=='Tics'and DialogueOn==false:
		North_Can_move=true

func _on_SouthPushArea_body_entered(body):
	if body.get_name()=='Tics'and DialogueOn==false:
		South_Can_move=true

func _on_EastPushArea_body_entered(body):
	if body.get_name()=='Tics'and DialogueOn==false:
		East_Can_move=true

func _on_WestPushArea_body_entered(body):
	if body.get_name()=='Tics'and DialogueOn==false:
		West_Can_move=true

func _on_NorthPushArea_body_exited(body):
	if body.get_name()=='Tics':
		North_Can_move=false

func _on_SouthPushArea_body_exited(body):
	if body.get_name()=='Tics':
		South_Can_move=false
	

func _on_EastPushArea_body_exited(body):
	if body.get_name()=='Tics':
		East_Can_move=false
	

func _on_WestPushArea_body_exited(body):
	if body.get_name()=='Tics':
		West_Can_move=false
	


func _on_NorthCollideDetector_area_entered(area):
	if area.get_name()=='StatueCollision':
		North_Cant_move=true

func _on_SouthCollideDetector2_area_entered(area):
		if area.get_name()=='StatueCollision':
			South_Cant_move=true

func _on_WestCollideDetector3_area_entered(area):
		if area.get_name()=='StatueCollision':
			West_Cant_move=true

func _on_EastCollideDetector4_area_entered(area):
		if area.get_name()=='StatueCollision':
			East_Cant_move=true


func _on_NorthCollideDetector_area_exited(area):
		if area.get_name()=='StatueCollision':
			North_Cant_move=false

func _on_SouthCollideDetector2_area_exited(area):
	if area.get_name()=='StatueCollision':
		South_Cant_move=false

func _on_WestCollideDetector3_area_exited(area):
	if area.get_name()=='StatueCollision':
		West_Cant_move=false

func _on_EastCollideDetector4_area_exited(area):
	if area.get_name()=='StatueCollision':
		East_Cant_move=false


func _on_NorthStatueCollide_body_entered(body):
	if 'MinePuzzleStatue' in body.name:
		North_Cant_move=true


func _on_NorthStatueCollide_body_exited(body):
	if 'MinePuzzleStatue' in body.name:
		North_Cant_move=false


func _on_SouthStatueCollide2_body_entered(body):
	if 'MinePuzzleStatue' in body.name:
		South_Cant_move=true


func _on_SouthStatueCollide2_body_exited(body):
	if 'MinePuzzleStatue' in body.name:
		South_Cant_move=false


func _on_WestStatueCollide3_body_entered(body):
	if 'MinePuzzleStatue' in body.name:
		West_Cant_move=true


func _on_WestStatueCollide3_body_exited(body):
	if 'MinePuzzleStatue' in body.name:
		West_Cant_move=false


func _on_EastStatueCollide4_body_entered(body):
	if 'MinePuzzleStatue' in body.name:
		East_Cant_move=true


func _on_EastStatueCollide4_body_exited(body):
	if 'MinePuzzleStatue' in body.name:
		East_Cant_move=false
