extends KinematicBody2D

var speed = 500
var velocity = Vector2()
var width = scale.x
var height = scale.y
var t=0

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		speed = 500
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		speed = 500
	if Input.is_action_pressed('ui_shift'):
		speed += 900
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	var collision = move_and_collide(velocity * delta)

func widen():
	t+=5
	position[1]=0
	print(scale)
	if scale.x<width*1.5:
		scale.x*=1.2
		scale.y*=1.2
	print(t)
	while t:
		yield(get_tree().create_timer(1), "timeout")
		t-=1
	scale.x=width
	scale.y=height
	
