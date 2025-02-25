extends Label3D

func _process(_delta: float) -> void:
	text = str(Radio.getValue()).pad_decimals(2)
