extends KinematicBody2D
var velocity = Vector2.ZERO

func _ready():
	$Sprite.modulate = Color(0,0,1)
	velocity = Vector2(200,0)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity *=-1


func hit():
	PlayerVariables.bricksLeft-=1
	queue_free()
