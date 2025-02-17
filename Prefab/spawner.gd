extends StaticBody3D

@export var prefab_conserve: PackedScene
@onready var marker_3d = $Marker3D

func spawn_conserve(quantity):
	print("conserve(s)")
	if not prefab_conserve:
		print("Erreur: Aucun prefab_conserve assigné!")
		return
	
	for i in range(quantity):
		var conserve = prefab_conserve.instantiate() 
		conserve.position = marker_3d.position  
		add_child(conserve) 
