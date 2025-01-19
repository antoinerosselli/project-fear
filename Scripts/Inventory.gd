extends Panel

func _input(event):
	if Input.is_action_just_pressed("select"):
		visible != visible
