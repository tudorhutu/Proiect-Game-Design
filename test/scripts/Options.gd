extends Control

var volume_level
var sound_effects_volume_level

func _ready():
	volume_level = PlayerVariables.volume
	sound_effects_volume_level = PlayerVariables.sound_effects_volume
	if(volume_level):
		$VBoxContainer/HSlider.value = volume_level
	if(sound_effects_volume_level):
		$VBoxContainer/HSlider2.value = PlayerVariables.sound_effects_volume
	
func _on_Back_pressed():
	get_tree().change_scene("res://scenes/screens/Menu.tscn")

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	PlayerVariables.volume = value


func _on_HSlider2_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound Effects"), value)
	PlayerVariables.sound_effects_volume = value
