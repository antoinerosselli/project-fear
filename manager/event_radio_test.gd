extends Node


func _on_test_01_timeout():
	if Radio.getValue() < 50:
		Tools.set_radio_sound(1,preload("res://voice/allonsmangerdesspag.mp3"))
		Tools.radio_text("Allons manger des spags !", 3)
