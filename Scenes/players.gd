extends Node

var boat = preload("res://Scenes/boat.tscn")

func _enter_tree():
	for i in range(GlobalTools.playerCount):
		var node = Node.new()
		node.name = str(i + 1)
		add_child(node)
		node.add_child(boat.instantiate())
