extends StaticBody2D
var hitcount

func _ready():
	hitcount=0

func hit():
	hitcount+=1
	$Sprite.modulate = Color(hitcount,0,0)
	if hitcount==2:
		PlayerVariables.bricksLeft-=1
		get_parent().queue_free()
		
