extends Control

@onready var credits = $credits

func _on_quit_button_pressed():
	get_tree().quit()

func _on_credit_pressed():
	credits.visible = true

func _on_close_pressed():
	credits.visible = false

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Days/Day1/scene_day_1.tscn")
