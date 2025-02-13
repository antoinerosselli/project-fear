extends Node

var time_elapsed = 0

#gouv
var gouv_rad = 0
var gouv_color = Color(0.117647, 0.564706, 1, 1)
var gouv_time = 0

#belle
var belle_rad = 0
var belle_color = Color(1, 0.0784314, 0.576471, 1)
var belle_time = 0

func _on_timer_timeout():
	time_elapsed += 1  # Incrémente le temps écoulé chaque seconde
	check_radio_conditions()

func radio_event_adv(sound, text, time_text, color_ok, what_fm, what_cd):
	Tools.set_radio_sound(1,load(sound))
	Tools.radio_text(text,time_text,color_ok)
	Tools.add_journal(what_fm, text, color_ok)
	if what_fm == "gouv":
		gouv_rad += 1
		if what_cd != 0:
			gouv_time = time_elapsed + what_cd
	elif what_fm == "belle":
		belle_rad += 1
		if what_cd != 0:
			belle_time = time_elapsed + what_cd
	
func check_radio_conditions():
	var radio_value = Radio.getValue()
	#gouv radio ==>
	if time_elapsed >= 30 and time_elapsed <= 70:
		if radio_value > 54 and radio_value < 64 and gouv_rad == 0:
			radio_event_adv("res://voice/allonsmangerdesspag.mp3", "Poisonous gases have invaded the streets, stay at home", 5, gouv_color, "gouv", 6)
		elif radio_value > 54 and radio_value < 64 and gouv_rad == 1 and time_elapsed > gouv_time:
			radio_event_adv("res://voice/allonsmangerdesspag.mp3", "To communicate with us, access the secure room using the button at the end of the corridor.", 5, gouv_color,"gouv", 0)
	if time_elapsed >= 100 and time_elapsed <= 240:  
		if radio_value > 54 and radio_value < 64 and gouv_rad == 2:
			radio_event_adv("res://voice/allonsmangerdesspag.mp3", "To signal your presence, activate the blue button and see if it works through your door." , 5, gouv_color,"gouv", 0)

	#belle radio ==>
	if time_elapsed >= 120 and time_elapsed <= 300:
		if radio_value > 22 and radio_value < 32 and belle_rad == 0:
			radio_event_adv("res://voice/allonsmangerdesspag.mp3", "Hello are there people out there who can hear me ?",5, belle_color, "belle", 6)
		elif radio_value > 22 and radio_value < 32 and belle_rad == 1 and time_elapsed > belle_time:
			radio_event_adv("res://voice/allonsmangerdesspag.mp3", "You too have discovered a room in your house !",5, belle_color, "belle", 0)
