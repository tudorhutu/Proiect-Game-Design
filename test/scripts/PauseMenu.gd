extends Control

func _ready():
	$Popup/VBoxContainer/ContinueButton.grab_focus()

func _on_ContinueButton_pressed():
	$Popup.hide()
	get_tree().paused = false
	
func _on_MenuButton_pressed():
	get_tree().change_scene("res://scenes/screens/Menu.tscn")
	get_tree().paused = false

func _on_QuitButton_pressed():
	get_tree().quit()
	get_tree().paused = false
