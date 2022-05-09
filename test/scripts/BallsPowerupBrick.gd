extends StaticBody2D
var hitcount
onready var ball_duplicate = preload("res://scenes/gameplay/Ball.tscn")
func _ready():
	$Sprite.modulate = Color(1,0,1)

func splithit(node:Node2D):
	if PlayerVariables.balls_on_screen<=1:
		var ball_duplicate_instace = ball_duplicate.instance()
		ball_duplicate_instace.position=node.position
		ball_duplicate_instace.get_node("BallBody").position = node.get_node("BallBody").position * 0.99
		ball_duplicate_instace.velocity = node.velocity
		get_parent().get_parent().add_child(ball_duplicate_instace)
		#PlayerVariables.ball_position = $Ball.position
		#PlayerVariables.ball_velocity = velocity
		PlayerVariables.bricksLeft-=1
		queue_free()
