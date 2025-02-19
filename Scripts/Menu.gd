extends Button

func _ready():
	grab_focus()

func _on_pressed():
	get_tree().change_scene_to_file("res://Scene/Days/Day1/scene_day_1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
