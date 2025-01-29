extends Camera3D

func _physics_process(delta):
	if current == true and Input.is_action_just_pressed("close"):
		var player = Tools.get_player()
		var camera_player = player.get_node("Camera3D")
		current = false
		camera_player.current = true
		player.paused = false
