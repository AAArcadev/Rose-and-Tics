extends AnimatedSprite

export var MaxHealth=30
var health=30

func _ready():
	get_parent().get_node("RoseHealthLabel/RoseHealthBar").max_value=MaxHealth
	
func _physics_process(_delta):
	get_parent().get_node("RoseHealthLabel/RoseHealthBar").value=health
	
func Damage(damageNo):
	health-=damageNo

