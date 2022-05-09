extends StaticBody2D

func hit():
	PlayerVariables.bricksLeft-=1
	get_parent().queue_free()
