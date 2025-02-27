extends Camera3D

var mouse = Vector2()
var following = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		mouse = event.position
	if event is InputEventMouseButton and (event.pressed == true || event.pressed == false):
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_following()

func get_following():
	following = false; #Viable à long terme? idk
	var worldspace = get_world_3d().direct_space_state
	var start = project_ray_origin(mouse)
	var end = project_position(mouse, 1000)
	var query = PhysicsRayQueryParameters3D.create(start, end)
	var result = worldspace.intersect_ray(query)

	if !result.is_empty():
		if result.collider_id == 32161924430:
			following = true
