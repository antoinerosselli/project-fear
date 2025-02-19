extends Label3D

func _process(_delta: float) -> void:
	text = "FM" + str(Radio.getValue()).pad_decimals(2)