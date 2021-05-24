extends StaticBody2D

var baseMoney = 10	
var isInside = false
var keysequence = []
var randkey = 0
var qpressed=false
var sequancecounter =0
var isDone=false
var prevvalue

onready var timer=$Timer
var pay = 0
var totalTime=10
func _ready():
	for i in 6:
		randomize()

		while randkey == prevvalue:
			randkey = randi()%6
		match randkey:
			0:
				keysequence.append("Q")
			1:
				keysequence.append("W")
			2:
				keysequence.append("E")
			3:
				keysequence.append("A")
			4:
				keysequence.append("S")
			5:
				keysequence.append("D")
		prevvalue = randkey
	$ColorRect/Label.text=str(keysequence)
	timer.wait_time = $PatianceMeter.value
				

	

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
	if keysequence.size() == 0:
		isDone=true
	
	if isInside:
		$ColorRect.visible = true
		while keysequence.size()>0:
			if Input.is_key_pressed(KEY_Q) and keysequence[0] == "Q":
				keysequence.remove(0)
				$ColorRect/Label.text=str(keysequence)
			elif Input.is_key_pressed(KEY_W) and keysequence[0] == "W":
				keysequence.remove(0)
				$ColorRect/Label.text=str(keysequence)	
			elif Input.is_key_pressed(KEY_E) and keysequence[0] == "E":
				keysequence.remove(0)
				$ColorRect/Label.text=str(keysequence)	
			elif Input.is_key_pressed(KEY_A) and keysequence[0] == "A":
				keysequence.remove(0)
				$ColorRect/Label.text=str(keysequence)
			elif Input.is_key_pressed(KEY_S) and keysequence[0] == "S":
				keysequence.remove(0)
				$ColorRect/Label.text=str(keysequence)	
			elif Input.is_key_pressed(KEY_D) and keysequence[0] == "D":
				keysequence.remove(0)
				$ColorRect/Label.text=str(keysequence)
			else:
				break														
		
	else:
		$ColorRect.visible = false
		


func _on_Area2D_area_entered(area):
	if area.is_in_group("playerhands"):
		isInside = true


func _on_Area2D_area_exited(area):
	if area.is_in_group("playerhands"):
		isInside = false


func _on_Timer_timeout():
	queue_free()
