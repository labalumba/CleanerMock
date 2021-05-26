extends Node

var wallet = 0

#movement
var maxspeed = 250
var acceleration = 300
var friction = 500

#upgrades
var moneyBonusMultiplier = 10

var smallDirtBasemoney = 10	
var bigDirtBaseMoney = 9
var carWashBaseMoney = 12

var patience = 0.5
var dirtcount = 4

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

