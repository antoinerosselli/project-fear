extends Node

const ICON = preload("res://Sprite/icon.svg")

func get_icon(item_name):
	match item_name:
		"test":
			return ICON as Texture2D
		_:
			print("param3 is not 3!")

func valid_quest(quest_id):
	match quest_id :
		1:
			print("valid")
		_:
			print("rien")

func get_player():
	var player = get_tree().get_first_node_in_group("player")
	return player

func call_pause():
	if get_tree().get_first_node_in_group("pause") == null:
		var mp:PackedScene = preload("res://Prefab/ui/pause.tscn")
		var mp_tmp = mp.instantiate()
		add_child(mp_tmp)
		print("pause !!")
	elif get_tree().get_first_node_in_group("pause") != null :
		var mp_tmp = get_tree().get_first_node_in_group("pause")
		mp_tmp.queue_free()

func get_color_fd():
	var lamp_door = get_tree().get_first_node_in_group("lamp_door")
	if lamp_door.spot_range != 0.00:
		print(lamp_door.light_color)
		if lamp_door.light_color == Color(1, 0, 0, 1):
			return "red"
		if lamp_door.light_color == Color(0, 0, 1, 1):
			return "blue"

func set_radio_sound(channel,sound):
	var radio_sound = get_tree().get_first_node_in_group("radio_sound")
	var audio_channel = radio_sound.get_child(channel - 1)
	print(audio_channel.name)
	audio_channel.set_stream(sound)
	audio_channel.play()

func radio_text(simple_text, time, color):
	var player = Tools.get_player()
	var text_radio = player.get_node("CanvasLayer/Control/show_text_radio")
	text_radio.text = simple_text
	text_radio.modulate = color
	var timer = Timer.new()
	timer.wait_time = time
	timer.one_shot = true
	timer.timeout.connect(func(): text_radio.text = "") 
	add_child(timer)
	timer.start()
