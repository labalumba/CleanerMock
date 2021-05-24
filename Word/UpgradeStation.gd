extends Area2D

var isInside = false
var menuOpen = false
onready var animationTree = get_node("UpgradeMenu/Control/AnimationPlayer")
onready var animationState = animationTree.get("parameters/playback")
onready var uiButton = get_node("UpgradeMenu/Control/ColorRect/MarginContainer/VBoxContainer/Button")
func _process(delta):
	if isInside:
		menuOpen = true
	else:
		menuOpen = false
		
func _ready():
	uiButton.release_focus()


func _on_UpgradeStation_area_entered(area):
	if area.is_in_group("playerhands"):
		animationTree.play("menuopen")
		uiButton.grab_focus()
		isInside=true

func _on_UpgradeStation_area_exited(area):
	if area.is_in_group("playerhands"):
		animationTree.play_backwards("menuopen")
		uiButton.release_focus()
		isInside=false
