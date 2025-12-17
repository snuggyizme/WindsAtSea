extends CharacterBody2D

@export var speed: float
@export var turning: float

@onready var playerNumber = get_parent().name

func _process(delta):
	if playerToAxis(playerNumber):
		rotation_degrees += turning * delta

func playerToAxis(pNo):
	return Input.get_axis("player" + pNo + "left", "player" + pNo + "right")
