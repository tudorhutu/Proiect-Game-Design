extends StaticBody2D
var hitcount

func _ready():
	$Sprite.modulate = Color(1,1,0)

func hit():
	var powerup =  load("res://scenes/bricks/powerups/WidenPowerup.tscn").instance()
	get_parent().add_child(powerup)
	PlayerVariables.bricksLeft-=1
	queue_free()
