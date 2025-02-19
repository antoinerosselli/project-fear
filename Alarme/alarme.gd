extends Node3D

@onready var label :Label3D= $Time

func _process(delta: float) -> void:
	label.text = "%02d:%02d" % [Horloge.getHours(), Horloge.getMinutes()]
