extends CharacterBody2D

var movement = {}

@onready var playerNumber = get_parent().name

func _process(delta):
	movement = windToSpeed(Aeolus.windDirection, Vector2.RIGHT.rotated(rotation))
	
	if playerToAxis(playerNumber):
		rotation_degrees += movement["turning"] * delta
	
	velocity += movement["acceleration"] * Vector2.RIGHT.rotated(rotation)
	
	velocity = velocity.clampf(0, movement["topSpeed"])
	
	move_and_slide()

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
			export["topSpeed"] = 4.5
			export["acceleration"] = 1.4
			export["turning"] = 3
		3:
			export["topSpeed"] = 4.75
			export["acceleration"] = 1.4
			export["turning"] = 3
		4:
			export["topSpeed"] = 6
			export["acceleration"] = 1.6
			export["turning"] = 2.75
	
	return export
