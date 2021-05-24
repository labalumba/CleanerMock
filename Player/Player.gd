extends KinematicBody2D

var velocity = Vector2.ZERO
var MAX_SPEED = 300
var acceleration=1200
var FRICTION=1400
onready var animationplayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	
	MAX_SPEED = Main.maxspeed
	acceleration = Main.acceleration
	FRICTION = Main.friction
	var input_vector = Vector2.ZERO
	input_vector.x= Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y= Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, acceleration*delta)

	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION* delta)

		
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	get_node("notiftext").text = ""
