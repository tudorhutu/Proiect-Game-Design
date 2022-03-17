extends Node2D

var is_dragging = false
var touchpos = Vector2.ZERO

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
