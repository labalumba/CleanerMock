extends CanvasLayer

var arabaspawner
var spawncount = 0



func _process(delta):
	$Control/ColorRect/Label.text= str("$") + str(Main.wallet)
	$Control/ColorRect/Label2.text="PAT:" + str(Main.patience)


func _on_Button_pressed():
	if Main.wallet >=25:
		Main.wallet-=25
		Main.acceleration+=250
		Main.friction+=250
		get_tree().get_root().get_node("World/YSort/Player/notiftext").add_color_override("font_color",Color(1,0,0,1))
		get_tree().get_root().get_node("World/YSort/Player/notiftext").text = "-$25" 
		get_tree().get_root().get_node("World/YSort/Player/notiftext/Timer").start()
		


func Button_CarSlot():
	if Main.wallet >=100:
		if spawncount == 1:
			Main.wallet-=100
			arabaspawner=load("res://Cars/ArabaSpawner.tscn").instance()
			get_tree().get_root().get_node("World/YSort").add_child(arabaspawner)
			arabaspawner.position = Vector2(400, 300) 
			$Control/ColorRect/MarginContainer/VBoxContainer/Button2.queue_free()
			get_tree().get_root().get_node("World/YSort/Player/notiftext").add_color_override("font_color",Color(1,0,0,1))
			get_tree().get_root().get_node("World/YSort/Player/notiftext").text = "-$100" 
			get_tree().get_root().get_node("World/YSort/Player/notiftext/Timer").start()
			
			
		elif spawncount == 0:	
			Main.wallet-=100
			arabaspawner=load("res://Cars/ArabaSpawner.tscn").instance()
			get_tree().get_root().get_node("World/YSort").add_child(arabaspawner)
			arabaspawner.position = Vector2(130, 300) 
			spawncount+=1
			get_tree().get_root().get_node("World/YSort/Player/notiftext").add_color_override("font_color",Color(1,0,0,1))
			get_tree().get_root().get_node("World/YSort/Player/notiftext").text = "-$100" 
			get_tree().get_root().get_node("World/YSort/Player/notiftext/Timer").start()	
			
			



func _on_Button3_pressed():
	if Main.wallet >=50:
		Main.wallet -=50
		Main.patience +=0.25
		#Main.dirtcount +=1 dirt count ++ with patience??
		if Main.dirtcount == 8:
			$Control/ColorRect/MarginContainer/VBoxContainer/Button3.queue_free()
			
		get_tree().get_root().get_node("World/YSort/Player/notiftext").add_color_override("font_color",Color(1,0,0,1))
		get_tree().get_root().get_node("World/YSort/Player/notiftext").text = "-$50" 
		get_tree().get_root().get_node("World/YSort/Player/notiftext/Timer").start()
		


func _on_Button4_pressed():
	if Main.wallet >=100:
		Main.wallet -=100
		Main.bonusMoney += 100


func _on_Button5_pressed():
	if Main.wallet >= 250:
		Main.wallet -=250
		Main.sprayScale *= 1.1
	if Main.sprayScale >=2:
		$Control/ColorRect/MarginContainer/VBoxContainer/Button5.queue_free()
