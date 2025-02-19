extends SpotLight3D

func _process(_delta):
	if UniqueTrait.elec == false:
		spot_range = 0.0
	elif UniqueTrait.elec == true:
		spot_range = 11.6
