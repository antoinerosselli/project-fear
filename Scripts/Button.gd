extends Button

func _ready():
	grab_focus()

func _on_pressed():
	queue_free()

func _on_quit_pressed():
	queue_free()
