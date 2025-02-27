class_name TimeSystem extends Node

@export var ticks_per_second :int= 60

func _process(delta: float) -> void:
	Horloge.increase_time_minutes(delta * ticks_per_second)
