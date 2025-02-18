extends Node3D

@export var rotation_speed :float= 0.03
var rotating :bool= false

func _input(_event):
	var player = Tools.get_player()
	if player.use_radio == true:
		var input = Input.get_vector("left", "right", "up", "down")
		if input.x : 
			var myrotate = input.x * rotation_speed
			var knobVal :float= fposmod($".".rotation.x, TAU) / TAU*100
			var _knobRotate :float= lerp_angle($".".rotation.x, myrotate, rotation_speed)
			rotate_x(myrotate)
			Radio.setValue(knobVal)
