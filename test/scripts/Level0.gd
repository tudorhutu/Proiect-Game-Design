extends Node2D

onready var basic_brick=preload("res://scenes/Brick.tscn")
onready var powerup_brick=preload("res://scenes/PowerupBrick.tscn")
var is_dragging = false
var touchpos = Vector2.ZERO
var start_clicked=0

func _ready():
	set_bricks()
	
func set_bricks():
	var numbricks=0
	for i in range(5):
		for j in range(13):
			var random_generator = RandomNumberGenerator.new()
			random_generator.randomize()
			var random_value = random_generator.randf_range(1,10)
			var basic_brick_instance=basic_brick.instance()
			var powerup_brick_instance=powerup_brick.instance()
			if int(random_value)!=3:
				basic_brick_instance.position=Vector2(100+70*j,70+50*i)
				add_child(basic_brick_instance)
			else:
				powerup_brick_instance.position=Vector2(100+70*j,70+50*i)
				add_child(powerup_brick_instance)
			numbricks+=1

	
func _input(event):
	if event is InputEventMouseButton || Input.is_action_pressed('ui_space') :
		if start_clicked==0:
			$Ball.velocity = Vector2(350,350)
			is_dragging = true
			start_clicked+=1

