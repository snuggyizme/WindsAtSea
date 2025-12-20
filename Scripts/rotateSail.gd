extends Sprite2D

func _process(_delta):
	global_rotation = Aeolus.windDirection.angle() + PI / 2
