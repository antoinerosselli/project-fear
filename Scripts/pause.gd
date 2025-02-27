extends Button
@onready var control = $"../.."

func _ready():
	grab_focus()

func _on_pressed():
	var player = Tools.get_player()
	player.paused = false
	control.queue_free()

func _on_quit_pressed():
	var player = Tools.get_player()
	player.paused = false
	control.queue_free()
	get_tree().change_scene_to_packed(load("res://Scene/menu3D.tscn") as PackedScene)
