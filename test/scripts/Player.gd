extends Node2D

func moveTo(pos):
	$Player.global_position.x=pos.x;
	$Player.global_position.y=get_viewport_rect().size[1]-20;
	
	
func dragTo(pos):
	$Player.global_position.x=pos.x;
	$Player.global_position.y=get_viewport_rect().size[1]-20;
	
	
