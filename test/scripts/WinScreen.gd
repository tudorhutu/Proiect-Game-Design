extends Control

func _ready():
	$VBoxContainer/ContinueButton.grab_focus()

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_ReplayButton_pressed():
	get_tree().change_scene("res://scenes/level0.tscn")


func _on_MenuButton_pressed():
	get_tree().change_scene("res://scenes/screens/Menu.tscn")
