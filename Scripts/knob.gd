extends Node2D

var following = false
const MAX_DISTANCE := 7000

func _physics_process(delta: float) -> void:
	var mouseDist := get_global_mouse_position().distance_squared_to($Knob.global_position)
	if mouseDist < MAX_DISTANCE and Input.is_action_just_pressed("click"):
		following = true
	if Input.is_action_just_released("click"):
		following = false

	if following:
		var ang := get_global_mouse_position().angle_to_point($Knob.global_position) - PI/2
		var diff :Vector2= $Knob/KnobAngle.position.rotated($Knob.rotation)
		var a = $Middle.position.angle_to(diff)
		var knobValues :float= remap(a, -3.14, 3.14, 0, 100)
		var knobSpeed :float= lerp_angle($Knob.rotation, ang, 0.1)
		$Knob.rotation = clamp(knobSpeed, -2, 2)
		Radio.setValue(knobValues)
