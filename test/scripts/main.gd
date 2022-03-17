extends Node2D

onready var br=preload("res://scenes/Brick.tscn")
var is_dragging = false
var touchpos = Vector2.ZERO

func _ready():
	set_bricks()

func set_bricks():
	var numbricks=0
	for i in range(5):
		for j in range(13):
			var brick=br.instance()
			brick.position=Vector2(100+70*j,70+50*i)
			numbricks+=1
			add_child(brick)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.position.y > 80:
			$Ball.direction = Vector2(300,300)
			is_dragging = true
	if event.position.y > 80:
		if is_dragging:
			touchpos = event.position

func _physics_process(delta):
	if is_dragging:
		$Player.dragTo(touchpos)
