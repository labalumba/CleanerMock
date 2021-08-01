extends StaticBody2D

var baseMoney = 10	
var isInside = false
var isDone = false
onready var timer=$Timer
var pay = 0
var totalTime=10


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	timer.wait_time = $PatianceMeter.value

# Called when the node enters the scene tree for the first time.
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
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Area2D_area_entered(area):
	if area.is_in_group("playerhands"):
		isInside = true


func _on_Area2D_area_exited(area):
	if area.is_in_group("playerhands"):
		isInside = false
