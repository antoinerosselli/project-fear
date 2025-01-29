extends Node3D

@export var rotation_speed :float= 0.01
var rotating :bool= false
var last_mouse_pos := Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			rotating = event.pressed
			last_mouse_pos = event.position

	if event is InputEventMouseMotion and rotating:
		var rotate = event.relative.y * rotation_speed
		var knobVal :float= fposmod($".".rotation.x, TAU) / TAU*100
		var knobRotate :float= lerp_angle($".".rotation.x, rotate, rotation_speed)
		
		rotate_x(rotate)
		print(knobVal)
