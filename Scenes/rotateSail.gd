extends Sprite2D

func _process(_delta):
	rotation = Aeolus.windDirection.angle()
