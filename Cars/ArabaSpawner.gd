extends Node2D

var isEmpty = false
var arabatype = 0
var araba
var timeleft=0


onready var timer=get_node("Timer")


func _process(delta):
	
	
	if self.get_child_count() == 4:
		timer.start()
	timeleft= timer.get_time_left()
	$Label.text=str(floor(timeleft))
		


	

func _on_Timer_timeout():
	print("here i go")
	randomize()
	arabatype=randi()%3
	match arabatype:
		0:
			araba=load("res://Cars/Araba.tscn").instance()
		1:
			araba=load("res://Cars/Araba2.tscn").instance()
		2:
			araba=load("res://Cars/Araba3.tscn").instance()
	
	add_child(araba)





	
