extends Node3D

@onready var audioStream = $AudioStreamPlayer3D
@onready var Audio1 = $AudioStreamPlayer3D/Audio1
@onready var Audio2 = $AudioStreamPlayer3D/Audio2
@onready var Audio3 = $AudioStreamPlayer3D/Audio3

#const AudioStatic = preload("res://Radio/edm-static-240838.mp3")
#const Audio1 = preload("res://Radio/float-void-144817.mp3")
#const Audio2 = preload("res://Radio/ode-to-joy-piano-68697.mp3")
#const Audio3 = preload("res://Radio/red-and-blue-145386.mp3")

func _ready():
	audioStream.play()

func _process(data):
	#print(Radio.getValue())
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
