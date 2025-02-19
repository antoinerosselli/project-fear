extends Node

var time_elapsed = 0
var event_adv = 0

func _on_timer_timeout():
	time_elapsed += 1
	check_event_conditions()
	
func check_event_conditions():
	#helico event
	if time_elapsed == 30:
		print("helico event")
		Tools.get_player().sanity = 29
		Tools.start_sound("res://Music&Sound/helicopter-sound-effect-241421.mp3")
	#remove alarm
	if time_elapsed == 50 :
		print("remove alarm")
		var alarm = get_tree().get_first_node_in_group("alarm")
		alarm.stop()
	#helicot event drop
	if time_elapsed == 190 :
		print("helico drop")
		Tools.start_sound("res://Music&Sound/helicopter-sound-effect-241421.mp3")
		Tools.spawn_conserve(2)
