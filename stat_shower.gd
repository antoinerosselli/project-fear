extends Node3D

@onready var stat_value = $SubViewport/StatValue
@export var name_value:String

func _process(delta):
	stat_value.text = "10" + "%"
