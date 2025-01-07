extends StaticBody3D

@export var item_name:String

@export_category("pickable ?")
@export var pickable:bool

@export_category("text ?")
@export var is_text:bool
@export var texts = []

@export_category("is a doors ?")
@export var door:bool
@export var rotation_amount = 1.5

func _ready():
	pass 
	
func interact():
	print("interact")
	if is_text == true:
		var player = Tools.get_player()
		player.dialogues = texts
	if pickable == true:
		queue_free()
	if door == true:
		transform.basis = Basis(Vector3(0, 1, 0), rotation_amount) * transform.basis
		rotation_amount = -(rotation_amount)

func _process(delta):
	pass
