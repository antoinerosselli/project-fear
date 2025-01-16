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
