extends KinematicBody2D

var speed = 500
var velocity = Vector2()
var width = scale.x
var height = scale.y
var t=0
signal ui_update

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
	if Input.is_action_pressed('ui_cancel'):
		get_tree().paused = true
		$PausePopup/Popup.show()
func _physics_process(delta):
	get_input()
	var collision = move_and_collide(velocity * delta)

func widen():
	if(t<0):
		t=0
	if(t>15):
		t=15
	t+=5
	position[1]=0
	if scale.x<width*1.5:
		scale.x*=1.2
		scale.y*=1.2
	print(t)
	while t>0:
		yield(get_tree().create_timer(1), "timeout")
		t-=1
	scale.x=width
	scale.y=height

func lifeup():
	PlayerVariables.balls+=1
	emit_signal("ui_update")

