extends StaticBody3D

@export var item_name:String

@export_category("pickable ?")
@export var pickable:bool

@export_category("text ?")
@export var is_text:bool
@export var texts = []

func _ready():
	pass 
	
func interact():
	print("interact")
	if is_text == true:
		var player = Tools.get_player()
		player.dialogues = texts
	if pickable == true:
		queue_free()

func _process(delta):
	pass
