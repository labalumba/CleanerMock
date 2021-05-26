extends StaticBody2D

var baseMoney = Main.bigDirtBaseMoney
var destroy = false
var dirtindex = 0
var isDone
onready var timer=$Timer
var pay = 0
var totalTime=10
var destroycount=0
var dirtArray = ["Dirts/bigDirt1", "Dirts/bigDirt2", "Dirts/bigDirt3"]
func _ready():
	$PatianceMeter.max_value = totalTime*Main.patience
	$PatianceMeter.value = totalTime*Main.patience

	timer.start()
	randomize()
	while destroycount<=0:
		dirtindex = randi()%3
		if !get_node(dirtArray[dirtindex]).is_queued_for_deletion():
			get_node(dirtArray[dirtindex]).queue_free()
			destroycount+=1	
			#timer.wait_time = $PatianceMeter.value
			timer.wait_time = totalTime*Main.patience
			timer.start()

func _process(delta):
	$PatianceMeter.value = timer.time_left
	
	if isDone:
		pay = baseMoney + timer.get_time_left()*Main.moneyBonusMultiplier/(totalTime*Main.patience)
		pay = int(pay)
		print(pay)
		Main.wallet = Main.wallet + pay
		get_tree().get_root().get_node("World/YSort/Player/notiftext").add_color_override("font_color",Color(0,1,0,1))
		get_tree().get_root().get_node("World/YSort/Player/notiftext").text = "$" + str(pay)
		get_tree().get_root().get_node("World/YSort/Player/notiftext/Timer").start()
		print(Main.wallet) 
		queue_free()
	if $Dirts.get_child_count() == 0:
		isDone=true


func _on_Timer_timeout():
	queue_free()
