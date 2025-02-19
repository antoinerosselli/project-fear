extends Node3D

@onready var audioStream = $AudioStreamPlayer3D
@onready var Audio1 = $AudioStreamPlayer3D/Audio1
@onready var Audio2 = $AudioStreamPlayer3D/Audio2
@onready var Audio3 = $AudioStreamPlayer3D/Audio3

func _ready():
	audioStream.play()

func _process(_data):
	var player = Tools.get_player()
	if player.use_radio == true:
		radio_usage()
		
	var knobCurrentVal :float= Radio.getValue()
	
	if (knobCurrentVal > 85 && knobCurrentVal < 90 && Audio1.playing != true):
		Audio1.play()
		Audio2.stop()
		Audio3.stop()
	if (knobCurrentVal > 5 && knobCurrentVal < 10 && Audio2.playing != true):
		Audio1.stop()
		Audio2.play()
		Audio3.stop()
	if (knobCurrentVal > 25 && knobCurrentVal < 30 && Audio3.playing != true):
		Audio1.stop()
		Audio2.stop()
		Audio3.play()
	
	if (((knobCurrentVal > 80 && knobCurrentVal < 83) || 
	(knobCurrentVal > 90) || (knobCurrentVal > 0 && knobCurrentVal < 3) || 
	(knobCurrentVal > 10 && knobCurrentVal < 17) || (knobCurrentVal > 30 && knobCurrentVal < 39)) 
	&& audioStream.playing == true):
		audioStream.volume_db += 0.1
	
	if (((knobCurrentVal > 83 && knobCurrentVal < 85) || 
	(knobCurrentVal > 3 && knobCurrentVal < 5) || 
	(knobCurrentVal > 17 && knobCurrentVal < 25) || (knobCurrentVal > 39)) 
	&& audioStream.playing == true):
		audioStream.volume_db -= 0.1

func _on_audio_stream_player_3d_finished() -> void:
	audioStream.play()
	
func radio_usage():
	if Radio.getValue() < 0: Radio.setValue(0)
	if Radio.getValue() > 100: Radio.setValue(100)
	
	if Input.is_action_just_pressed("close"):
		var player = Tools.get_player()
		var radioObj = get_tree().get_first_node_in_group("radio")
		var radio_camera = radioObj
		var player_camera = player.get_node("Camera3D")
		var player_icon = player.get_node("CanvasLayer/Control/Icon")
		var player_use = player.get_node("CanvasLayer/Control/Label")
		player_icon.visible = true
		player_use.visible = true
		player.use_radio = false
		player.paused = false
		player_camera.current = true
		radio_camera.current = false
