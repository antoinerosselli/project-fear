extends Node
var time_elapsed = 0

var gouv_rad = 0
var gouv_color = Color(0.117647, 0.564706, 1, 1)
var belle_rad = 0
var belle_color = Color(0.580392, 0, 0.827451, 1)

func _on_timer_timeout():
	time_elapsed += 1  # Incrémente le temps écoulé chaque seconde
	check_radio_conditions()

func check_radio_conditions():
	var radio_value = Radio.getValue()
	#gouv radio ==>
	if time_elapsed >= 30 and time_elapsed <= 70:
		if radio_value > 54 and radio_value < 64 and gouv_rad == 0:
			Tools.set_radio_sound(1, preload("res://voice/allonsmangerdesspag.mp3"))
			Tools.radio_text("Poisonous gases have invaded the streets, stay at home", 5,gouv_color)
			gouv_rad += 1
		elif radio_value > 54 and radio_value < 64 and gouv_rad == 1:
			Tools.set_radio_sound(1, preload("res://voice/allonsmangerdesspag.mp3"))
			Tools.radio_text("To communicate with us, access the secure room using the button at the end of the corridor.", 5,gouv_color)
			gouv_rad += 1
	if time_elapsed >= 100 and time_elapsed <= 240:  
		if radio_value > 54 and radio_value < 64 and gouv_rad == 2:
			Tools.set_radio_sound(1, preload("res://voice/allonsmangerdesspag.mp3"))
			Tools.radio_text("To signal your presence, activate the blue button and see if it works through your door.", 5,gouv_color)
			gouv_rad += 1
	#belle radio ==>
	if time_elapsed >= 120 and time_elapsed <= 300:
		if radio_value > 22 and radio_value < 32 and belle_rad == 0:
			Tools.set_radio_sound(1, preload("res://voice/allonsmangerdesspag.mp3"))
			Tools.radio_text("Hello are there people out there who can hear me ?", 5, belle_color)
			belle_rad += 1
		elif radio_value > 22 and radio_value < 32 and belle_rad == 1:
			Tools.set_radio_sound(1, preload("res://voice/allonsmangerdesspag.mp3"))
			Tools.radio_text("You too have discovered a room in your house !", 5, belle_color)
			belle_rad += 1
