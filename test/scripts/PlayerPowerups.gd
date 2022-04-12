extends Node2D
signal ui_update

func _on_PlayerBody_ui_update():
	emit_signal("ui_update")

