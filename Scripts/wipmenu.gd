extends Control

# WIP MENU #

func startTwoPlayer():
	GlobalTools.playerCount = 2
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func startThreePlayer():
	GlobalTools.playerCount = 3
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func startFourPlayer():
	GlobalTools.playerCount = 4
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
