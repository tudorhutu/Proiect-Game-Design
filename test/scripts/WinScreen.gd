extends Control

func _ready():
	$VBoxContainer/ContinueButton.grab_focus()
	$Label.text = "Completed Level " + str(int(PlayerVariables.current_level))

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_ReplayButton_pressed():
	get_tree().change_scene("res://scenes/levels/level" + str(int(PlayerVariables.current_level)) + ".tscn")


func _on_MenuButton_pressed():
	get_tree().change_scene("res://scenes/screens/Menu.tscn")


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://scenes/levels/level" + str(int(PlayerVariables.current_level) + 1) + ".tscn")
	PlayerVariables.current_level += 1
