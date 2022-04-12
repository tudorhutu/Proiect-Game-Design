extends Control
func _on_Ball_ui_update():
	$Label.text = str(PlayerVariables.balls)+"    X"


func _on_Player_ui_update():
	$Label.text = str(PlayerVariables.balls)+"    X"
