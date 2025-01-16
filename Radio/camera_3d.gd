extends Camera3D

var mouse = Vector2()

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		mouse = event.position
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_following()

func get_following():
	var worldspace = get_world_3d().direct_space_state
	var start = project_ray_origin(mouse)
	var end = project_position(mouse, 1000)
	var query = PhysicsRayQueryParameters3D.create(start, end)
	var result = worldspace.intersect_ray(query)
	print(result)
