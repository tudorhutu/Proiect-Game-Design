extends Node2D


onready var basic_brick=preload("res://scenes/bricks/Brick.tscn")
onready var widen_powerup_brick=preload("res://scenes/bricks/WidenPowerupBrick.tscn")
onready var life_powerup_brick=preload("res://scenes/bricks/LifePowerupBrick.tscn")
onready var moving_brick=preload("res://scenes/bricks/MovingBrick.tscn")

var is_dragging = false
var touchpos = Vector2.ZERO
var start_clicked=0
var numbricks 

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerVariables.balls_on_screen=0
	PlayerVariables.balls=3
	var context = get_tree().current_scene.filename
	PlayerVariables.current_level=int(context[-6])
	count_brix()
	PlayerVariables.bricksLeft=numbricks
	
	var music = AudioStreamPlayer.new()
	add_child(music)
	var stream = load("res://assets/Ambience/ambience.mp3")
	music.set_stream(stream)
	music.volume_db = -2
	music.pitch_scale = 1
	music.play()

func count_brix():
	numbricks = $Bricks.get_child_count()

func _input(event):
	if event is InputEventMouseButton || Input.is_action_pressed('ui_space') :
		if PlayerVariables.startClicked==0:
			$Ball.velocity = Vector2(350,350)
			is_dragging = true
			PlayerVariables.startClicked=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
