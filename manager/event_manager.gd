extends Node


func _on_test_01_timeout():
	var player = Tools.get_player()
	if Tools.get_color_fd() == "red":
		player.dialogues = ["Un bruit d'Helicopter !"]
	
func _on_test_02_timeout():
	var player = Tools.get_player()
	if Tools.get_color_fd() == "blue":
		player.dialogues = ["Un bruit de caca !"]
