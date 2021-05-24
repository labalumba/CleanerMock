extends StaticBody2D

var baseMoney = 7	
var destroy = false
var dirtindex = 0
var isDone = false
onready var timer=$Timer
var pay = 0
var totalTime=10

var destroycount=0
var dirtArray = ["Dirts/Dirt1", "Dirts/Dirt2", "Dirts/Dirt3", "Dirts/Dirt4", "Dirts/Dirt5","Dirts/Dirt6", "Dirts/Dirt7", "Dirts/Dirt8"] 

func _ready():
	
	timer.start()
	randomize()
	while destroycount<=3:
		dirtindex = randi()%8
		if !get_node(dirtArray[dirtindex]).is_queued_for_deletion():
			get_node(dirtArray[dirtindex]).queue_free()
			destroycount+=1	
			timer.wait_time = $PatianceMeter.value

func _process(delta):
	$PatianceMeter.value = timer.time_left
	if isDone:
		pay = baseMoney + (totalTime - timer.get_time_left())*.8
		pay = int(pay)
		print(pay)
		Main.wallet = Main.wallet + pay
		print(Main.wallet) 
		get_tree().get_root().get_node("World/YSort/Player/notiftext").text = "$" + str(pay)
		get_tree().get_root().get_node("World/YSort/Player/notiftext/Timer").start()
		queue_free()
	if $Dirts.get_child_count() == 0:
		isDone=true


func _on_Timer_timeout():
	pay = 0
	queue_free()
