extends Node

var time_elapsed = 0
var event_adv = 0

func _on_timer_timeout():
	time_elapsed += 1
	check_event_conditions()
	
func check_event_conditions():
	#remove alarm
	if time_elapsed == 50 :
		print("remove alarm")
		var alarm = get_tree().get_first_node_in_group("alarm")
		alarm.stop()
