extends CharacterBody3D

@onready var ray_cast_3d = $Camera3D/RayCast3D
@onready var item_list = $CanvasLayer/Control/ItemList
@onready var timer = $CanvasLayer/Control/show_text/Timer
@onready var show_text = $CanvasLayer/Control/show_text
@onready var inventory = $CanvasLayer/Control/Inventory
@onready var logo_inter = $CanvasLayer/Control/Label
@onready var camera_3d = $Camera3D

var dialogues_id:int = 0
var dialogues:Array = []
var read_dialogue = false

var paused:bool = false

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 5
var jump_speed = 5
var mouse_sensitivity = 0.002
var camera_sensitivity = 0.04
var can_interact:bool = false

var crouch:bool = false

var item

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func dialogues_manager():
	print(dialogues[dialogues_id])
	show_text.text = dialogues[dialogues_id]
	read_dialogue = true
	var tmp_array = dialogues[dialogues_id].rsplit(" ", true, 1)
	timer.start(1 + (tmp_array.size() / 2))
	dialogues_id += 1

func _physics_process(delta):
	if paused == false:
		if dialogues.size() > dialogues_id:
			if dialogues[dialogues_id] != null && read_dialogue == false:
				dialogues_manager()
		else :
			dialogues = []
			dialogues_id = 0
		velocity.y += -gravity * delta
		var input = Input.get_vector("left", "right", "up", "down")
		var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
		velocity.x = movement_dir.x * speed
		velocity.z = movement_dir.z * speed

		if ray_cast_3d.is_colliding():
			item = ray_cast_3d.get_collider()
			if item != null:
				if item.has_method("interact"):
					can_interact = true
				else :
					can_interact = false
		else:
			item = null
			can_interact = false

		camera_joystick()

		if can_interact == true:
			logo_inter.visible = true
		elif can_interact == false:
			logo_inter.visible = false

		move_and_slide()
		if Input.is_action_just_pressed("interact") and can_interact == true:
			print(item.item_name)
			item.interact()
			item = null
			can_interact = false	

func camera_joystick():
	var input_dir = Vector2(
		Input.get_joy_axis(0, 2),  # Axis 2 (right joystick horizontal)
		Input.get_joy_axis(0, 3)   # Axis 3 (right joystick vertical)
	)

	rotate_y(-input_dir.x * camera_sensitivity)
	$Camera3D.rotate_x(-input_dir.y * camera_sensitivity)
	$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))


func _input(event):
	if Input.is_action_just_pressed("pause"):
		Tools.call_pause()
		paused = !paused
	if Input.is_action_just_pressed("crouch"):
		print("crouch")
		if crouch == false:
			camera_3d.position.y -= 1.3
			speed -= 4
			crouch = true
		elif crouch == true:
			camera_3d.position.y += 1.3
			speed += 4
			crouch = false
	if Input.is_action_just_pressed("select"):
		print("inventory")
		if inventory.visible == false :
			inventory.visible = true
		elif inventory.visible == true :
			inventory.visible = false
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))

func _on_timer_timeout():
	read_dialogue = false
	show_text.text = ""
