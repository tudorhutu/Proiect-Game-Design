extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/levels/level0.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
