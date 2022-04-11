extends StaticBody2D
var hitcount

func _ready():
	$Sprite.modulate = Color(1,1,0)

func hit():
	var ball =  load("res://scenes/Powerup.tscn").instance()
	#ball.global_position = Vector2(10,10)
	get_parent().add_child(ball)
	queue_free()
