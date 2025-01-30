extends Node3D

@export var rotation_speed :float= 0.03
var rotating :bool= false

func _input(event):
	var input = Input.get_vector("left", "right", "up", "down")
	if input.x:
		var rotate = input.x * rotation_speed
		var knobVal :float= fposmod($".".rotation.x, TAU) / TAU*100
		var knobRotate :float= lerp_angle($".".rotation.x, rotate, rotation_speed)
		rotate_x(rotate)
		Radio.setValue(knobVal)
