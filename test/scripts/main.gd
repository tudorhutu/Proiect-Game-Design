extends Node2D

onready var br=preload("res://scenes/Brick.tscn")
var is_dragging = false
var touchpos = Vector2.ZERO
var start_clicked=0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	"""Input.set_custom_mouse_cursor(preload("res://assets/yt_assets/placeholdercursor.png"))"""
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
			if start_clicked==0:
				$Ball.direction = Vector2(300,300)
				is_dragging = true
				start_clicked+=1
	if event.position.y > 80:
		if is_dragging:
			touchpos = event.position

func _physics_process(delta):
	if is_dragging:
		$Player.dragTo(touchpos)
