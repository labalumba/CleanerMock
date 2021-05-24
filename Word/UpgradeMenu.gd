extends CanvasLayer

var arabaspawner
var spawncount = 0
func _process(delta):
	$Control/ColorRect/Label.text= str("$") + str(Main.wallet)


func _on_Button_pressed():
	if Main.wallet >=25:
		Main.wallet-=25
		Main.acceleration+=250
		Main.friction+=250


func Button_CarSlot():
	if Main.wallet >=100:
		if spawncount == 1:
			Main.wallet-=100
			arabaspawner=load("res://Cars/ArabaSpawner.tscn").instance()
			get_tree().get_root().get_node("World/YSort").add_child(arabaspawner)
			arabaspawner.position = Vector2(400, 300) 
			$Control/ColorRect/MarginContainer/VBoxContainer/Button2.queue_free()
		elif spawncount == 0:	
			Main.wallet-=100
			arabaspawner=load("res://Cars/ArabaSpawner.tscn").instance()
			get_tree().get_root().get_node("World/YSort").add_child(arabaspawner)
			arabaspawner.position = Vector2(130, 300) 
			spawncount+=1

