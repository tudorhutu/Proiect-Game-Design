extends Node2D

onready var basic_brick=preload("res://scenes/bricks/Brick.tscn")
onready var widen_powerup_brick=preload("res://scenes/bricks/WidenPowerupBrick.tscn")
onready var life_powerup_brick=preload("res://scenes/bricks/LifePowerupBrick.tscn")
onready var balls_powerup_brick=preload("res://scenes/bricks/BallsPowerupBrick.tscn")
onready var moving_brick=preload("res://scenes/bricks/MovingBrick.tscn")
var is_dragging = false
var touchpos = Vector2.ZERO
var start_clicked=0
var numbricks 
func _ready():
	PlayerVariables.balls_on_screen=0
	PlayerVariables.balls=3
	PlayerVariables.balls_on_screen=1
	$Control/Label.text = str(PlayerVariables.balls)+"    X"
	set_bricks()
	PlayerVariables.bricksLeft=numbricks
	
	
func set_bricks():
	numbricks=0
	for i in range(4): #5
		for j in range(13): #13
			var random_generator = RandomNumberGenerator.new()
			random_generator.randomize()
			var random_value = random_generator.randf_range(1,10)
			var basic_brick_instance=balls_powerup_brick.instance()
			var widen_powerup_brick_instance=widen_powerup_brick.instance()
			var life_powerup_brick_instance=life_powerup_brick.instance()
			var balls_brick_instance=balls_powerup_brick.instance()
			if int(random_value)==1:
				widen_powerup_brick_instance.position=Vector2(100+70*j,70+45*i)
				add_child(widen_powerup_brick_instance)
			elif int(random_value)==2:
				life_powerup_brick_instance.position=Vector2(100+70*j,70+45*i)
				add_child(life_powerup_brick_instance)
			else:
				basic_brick_instance.position=Vector2(100+70*j,70+45*i)
				add_child(basic_brick_instance)
			numbricks+=1
	var moving_brick_instance=moving_brick.instance()
	moving_brick_instance.position=Vector2(170,250)
	add_child(moving_brick_instance)
	numbricks+=1
	moving_brick_instance=moving_brick.instance()
	moving_brick_instance.position=Vector2(700,295)
	add_child(moving_brick_instance)
	numbricks+=1
	
func _input(event):
	if event is InputEventMouseButton || Input.is_action_pressed('ui_space') :
		if PlayerVariables.startClicked==0:
			$Ball.velocity = Vector2(350,350)
			is_dragging = true
			PlayerVariables.startClicked=1



