extends Node2D

var velocity = Vector2.ZERO
signal ui_update
signal level_over 

func _ready():
	PlayerVariables.balls_on_screen+=1
	if(PlayerVariables.startClicked==0):
		velocity = Vector2(0,0)
	print("instantiated:",PlayerVariables.balls_on_screen)
	
func CheckBricksLeft():
	if PlayerVariables.bricksLeft==0:
		PlayerVariables.balls += 1
		emit_signal("level_over")
		get_tree().change_scene("res://scenes/screens/WinScreen.tscn")
	
func _physics_process(delta):
	var collision=$BallBody.move_and_collide(velocity*delta)
	if collision:
		CheckBricksLeft()
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		$BallBody.move_and_collide(reflect)
		velocity *= 1.001
		if(collision.collider.name=='PlayerBody'):
			$PaddleHitAudio.play()
		if(collision.collider.name=='WallBody' or collision.collider.name=='RoofBody'):
			$WallHitAudio.play()
		if(collision.collider.name=='BrickBody'):
			collision.collider.hit()
			$BrickHitAudio.play()
		if(collision.collider.name=='SplitBrickBody'):
			collision.collider.splithit(self)
		

func _on_VisibilityNotifier2D_screen_exited():
	$BallBody.position = Vector2.ZERO
	#PlayerVariables.balls_on_screen-=1
	if PlayerVariables.balls_on_screen<=0:
		velocity = Vector2.ZERO
		if PlayerVariables.balls==0:
			PlayerVariables.startClicked=0
			emit_signal("ui_update")
			get_tree().change_scene("res://scenes/screens/DeathScreen.tscn")
		else:
			PlayerVariables.startClicked=0
			PlayerVariables.balls-=1
			emit_signal("ui_update")
	else:
		queue_free()


		
