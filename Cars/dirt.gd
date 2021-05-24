extends Area2D

var isInside = false


#func _ready():
#	var destroy = false
#	randomize()
#	if randi()%2:
#		destroy = true
#	if destroy :queue_free()


func _process(delta):
	if isInside:
		if Input.is_action_just_pressed("spray"):
			queue_free()	

func _on_Dirt_area_entered(area):
	if area.is_in_group("playerhands"):
		isInside=true



func _on_Dirt_area_exited(area):
	if area.is_in_group("playerhands"):
		isInside=false

