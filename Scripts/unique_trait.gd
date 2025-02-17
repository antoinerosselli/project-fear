extends Node

var elec:bool = true

func unique(object_name):
	match object_name:
		"codesr":
			var sdoor = get_tree().get_first_node_in_group("secretdoor")
			sdoor.get_node("AnimationPlayer").play("open")
		"front_door":
			var front_door = get_tree().get_first_node_in_group("frontdoor")
			var door_camera = front_door.get_node("Camera3D")
			var player = Tools.get_player()
			var player_camera = player.get_node("Camera3D")
			var player_icon = player.get_node("CanvasLayer/Control/Icon")
			var player_use = player.get_node("CanvasLayer/Control/Label")
			player_icon.visible = false
			player_use.visible = false
			player.paused = true
			player_camera.current = false
			door_camera.current = true
		"blue_lamp":
			var lamp_door = get_tree().get_first_node_in_group("lamp_door")
			lamp_door.light_color = Color(0, 0, 1, 1)
		"red_lamp":
			var lamp_door = get_tree().get_first_node_in_group("lamp_door")
			lamp_door.light_color = Color(1, 0, 0, 1)
		"sancheck":
			if elec == true :
				var player = Tools.get_player()
				if player.sanity >= 70: 
					player.dialogues = ["Tout à l'air bon"]
				elif player.sanity <= 70:
					player.dialogues = ["Plus rien ne va..."]
		"courant":
			elec = !elec
		"radio":
			var radioObj = get_tree().get_first_node_in_group("radio")
			var radio_camera = radioObj
			var player = Tools.get_player()
			var player_camera = player.get_node("Camera3D")
			var player_icon = player.get_node("CanvasLayer/Control/Icon")
			var player_use = player.get_node("CanvasLayer/Control/Label")
			player_icon.visible = false
			player_use.visible = false
			player.use_radio = true
			player.paused = true
			player_camera.current = false
			radio_camera.current = true
		"conserve":
			get_tree().get_first_node_in_group("foods").add_conserve()
			print("TAKE FOOD")
