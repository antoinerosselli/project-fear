extends Node

func unique(object_name):
	print(object_name)
	match object_name:
		"codesr":
			var sdoor = get_tree().get_first_node_in_group("secretdoor")
			sdoor.get_node("AnimationPlayer").play("open")
