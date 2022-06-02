extends StaticBody2D
var hitcount

func _ready():
	hitcount=0

func hit():
	hitcount+=1
	$Sprite.texture = preload("res://assets/Bricks/BRoken_brick.jpg")
	if hitcount==2:
		PlayerVariables.bricksLeft-=1
		get_parent().queue_free()
		
