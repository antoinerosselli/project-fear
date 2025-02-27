extends Control

func _ready():
	print(Input.get_mouse_mode())
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	print(Input.get_mouse_mode())

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scene/menu3D.tscn")
