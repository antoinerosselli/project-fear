extends Marker3D

@export var pills:PackedScene

func spawn():
	var npills = pills.instantiate()
	self.add_child(npills)
