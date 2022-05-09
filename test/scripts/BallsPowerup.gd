extends Node2D

var velocity = Vector2.ZERO

func _ready():
	$Powerup_body/Sprite.modulate=Color(1,0,1)
	velocity = Vector2(0,200)
	
func _physics_process(delta):
	var collision=$Powerup_body.move_and_collide(velocity*delta)
	if collision:
		collision.collider.balls()
		get_parent().queue_free()
