extends Node2D

var velocity = Vector2.ZERO

func _ready():
	velocity = Vector2(0,0)
	
func _physics_process(delta):
	var collision=$Ball.move_and_collide(velocity*delta)
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		$Ball.move_and_collide(reflect)
		velocity *= 1.001
		if(collision.collider.name=='BrickBody'):
			collision.collider.hit()
		get_node('../Player/PlayerBody').position[1] = 0



func _on_VisibilityNotifier2D_screen_exited():
	get_tree().reload_current_scene()
