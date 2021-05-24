extends Area2D

var isInside = false
onready var dirtHP = 5
onready var percentHP = 100
onready var fullHP = dirtHP
var num_frames




func _process(delta):
	percentHP = 100*dirtHP/fullHP
	

	if percentHP <=66 and percentHP >33:
		$Sprite.set_frame(1)
	if percentHP < 33:
		$Sprite.set_frame(2)
	if dirtHP == 0:
		queue_free()
		
	if isInside:
		if Input.is_action_just_pressed("spray"):
			dirtHP-=1	

func _on_Dirt_area_entered(area):
	if area.is_in_group("playerhands"):
		isInside=true



func _on_Dirt_area_exited(area):
	if area.is_in_group("playerhands"):
		isInside=false

