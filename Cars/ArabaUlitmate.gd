extends StaticBody2D

var baseMoney = 10	
var isInside = false
var isDone = false
onready var timer=$Timer
var pay = 0
var totalTime=10


func _ready():
	timer.wait_time = $PatianceMeter.value
	timer.start()
	
func _process(delta):
	$PatianceMeter.value = timer.time_left
	if isDone:
		pay = baseMoney + (totalTime - timer.get_time_left())*.8
		pay = int(pay)
		print(pay)
		Main.wallet = Main.wallet + pay
		get_tree().get_root().get_node("World/YSort/Player/notiftext").text = "$" + str(pay)
		get_tree().get_root().get_node("World/YSort/Player/notiftext/Timer").start()		
		print(Main.wallet) 
		queue_free()
	

func _on_Area2D_area_entered(area):
	if area.is_in_group("playerhands"):
		isInside = true


func _on_Area2D_area_exited(area):
	if area.is_in_group("playerhands"):
		isInside = false
func _on_Timer_timeout():
	queue_free()
