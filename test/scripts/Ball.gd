extends Node2D

var velocity = Vector2.ZERO
signal ui_update
signal level_over 

func _ready():
	connect("ui_update",get_node('../Control'),"ui_update")
	velocity = Vector2(0,0)
	
func CheckBricksLeft():
	if PlayerVariables.bricksLeft==0:
		emit_signal("level_over")
		get_tree().change_scene("res://scenes/screens/WinScreen.tscn")
	
func _physics_process(delta):
	var collision=$Ball.move_and_collide(velocity*delta)
	if collision:
		CheckBricksLeft()
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		$Ball.move_and_collide(reflect)
		velocity *= 1.001
		if(collision.collider.name=='BrickBody'):
			collision.collider.hit()
		get_node('../Player/PlayerBody').position[1] = 0

func _on_VisibilityNotifier2D_screen_exited():
	$Ball.position = Vector2.ZERO
	velocity = Vector2.ZERO
	if PlayerVariables.balls==0:
		PlayerVariables.startClicked=0
		emit_signal("ui_update")
		get_tree().change_scene("res://scenes/screens/DeathScreen.tscn")
	else:
		PlayerVariables.startClicked=0
		PlayerVariables.balls-=1
		emit_signal("ui_update")

		
