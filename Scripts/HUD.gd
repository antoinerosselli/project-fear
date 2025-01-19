extends Control

@onready var inventory = $Inventory

func _input(event):
	if Input.is_action_just_pressed("select"):
		inventory.visible != inventory.visible
