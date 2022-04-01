extends Node2D

onready var br=preload("res://scenes/Brick.tscn")
var is_dragging = false
var touchpos = Vector2.ZERO
var start_clicked=0

func _ready():
	set_bricks()
	
func set_bricks():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var colorNum = rng.randi_range(0, 1)
	var numbricks=0
	for i in range(5):
		for j in range(13):
			var brick=br.instance()
			rng.randomize()
#			colorNum = rng.randi_range(0, 1)
#			brick.modulate = Color(colorNum, 0, 0)
			brick.position=Vector2(100+70*j,70+50*i)
			numbricks+=1
			add_child(brick)

	
func _input(event):
	if event is InputEventMouseButton || Input.is_action_pressed('ui_space') :
		if start_clicked==0:
			$Ball.velocity = Vector2(350,350)
			is_dragging = true
			start_clicked+=1
