extends Node2D

var windDirection = Vector2.RIGHT
var windStrength = 1.0
var windDirectionAngle: float

func _process(_delta):
	windDirectionAngle += 0.0005
	windDirection = windDirection.rotated(windDirectionAngle)
