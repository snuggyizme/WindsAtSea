extends CharacterBody2D

var acceleration: float
var speed: float
var turning: float

@onready var playerNumber = get_parent().name

func _process(delta):
	if playerToAxis(playerNumber):
		rotation_degrees += turning * delta
		

func playerToAxis(pNo):
	return Input.get_axis("player" + pNo + "left", "player" + pNo + "right")

func windToSpeed(wind, boatForward) -> Dictionary:
	var export = {}
	
	var alignment = boatForward.dot(wind)
	var band: int
	
	if alignment < -0.8:
		band = 0
	elif alignment < -0.5:
		band = 1
	elif alignment < 0:
		band = 2
	elif alignment < 0.8:
		band = 3
	elif alignment <= 1:
		band = 4
	
	match band:
		0:
			export["topSpeed"] = 2.0
			export["acceleration"] = 1.25
			export["turning"] = 2.5
		1:
			export["topSpeed"] = 3.0
			export["acceleration"] = 1.25
			export["turning"] = 2.75
		2:
			export["topSpeed"] = 2.0
			export["acceleration"] = 1.25
			export["turning"] = 2.5
		3:
			export["topSpeed"] = 2.0
			export["acceleration"] = 1.25
			export["turning"] = 2.5
		4:
			export["topSpeed"] = 2.0
			export["acceleration"] = 1.25
			export["turning"] = 2.5
	
	return export
