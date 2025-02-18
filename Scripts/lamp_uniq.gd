extends MeshInstance3D

@onready var light = $OmniLight3D

func _process(_delta):
	if UniqueTrait.elec == false:
		light.omni_range = 0.0
	elif UniqueTrait.elec == true:
		light.omni_range = 5.0
