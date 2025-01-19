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

@export_category("is an interruptor ?")
@export var is_on:bool
@export var is_an_interruptor:bool
@export var lamp:Node3D

@export_category("have an unique trait ?")
@export var script_trait:bool

func _ready():
	pass 
	
func interact():
	if is_text == true:
		var player = Tools.get_player()
		player.dialogues = texts
	if pickable == true:
		queue_free()
	if door == true:
		transform.basis = Basis(Vector3(0, 1, 0), rotation_amount) * transform.basis
		rotation_amount = -(rotation_amount)
	if is_an_interruptor == true:
		is_on = !is_on
		if UniqueTrait.elec == true :
			if is_on == true:
				var ligth = lamp.get_node("OmniLight3D")
				ligth.omni_range = 5.0
			elif  is_on == false:
				var ligth = lamp.get_node("OmniLight3D")
				ligth.omni_range = 0.0
	if script_trait == true:
		UniqueTrait.unique(item_name)


func _process(delta):
	pass
