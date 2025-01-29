extends Node

func unique(object_name):
	print(object_name)
	match object_name:
		"codesr":
			var sdoor = get_tree().get_first_node_in_group("secretdoor")
			sdoor.get_node("AnimationPlayer").play("open")
		"front_door":
			var front_door = get_tree().get_first_node_in_group("frontdoor")
			var door_camera = front_door.get_node("Camera3D")
			var player = Tools.get_player()
			var player_camera = player.get_node("Camera3D")
			player.paused = true
			player_camera.current = false
			door_camera.current = true
		"blue_lamp":
			var lamp_door = get_tree().get_first_node_in_group("lamp_door")
			lamp_door.light_color = Color(0, 0, 1, 1)
		"red_lamp":
			var lamp_door = get_tree().get_first_node_in_group("lamp_door")
			lamp_door.light_color = Color(1, 0, 0, 1)
