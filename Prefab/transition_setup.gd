extends Node

@onready var label = $Label
@onready var text_transi: String
@onready var ap = $AP

func transition(text):
	text_transi = text
	ap.play("fade_to_black")
	
func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "fade_to_black"):
		label.text = text_transi
		var timer = Timer.new()
		timer.wait_time = 10
		timer.one_shot = true
		timer.timeout.connect(_on_timer_timeout)
		add_child(timer)
		timer.start()

func _on_timer_timeout():
	label.text = "	"
	ap.play("RESET")
