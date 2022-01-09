extends Node2D

onready var GUI = $GUI

func _process(delta):
	GUI.get_node("Fuel").text = str(get_tree().current_scene.get_node("Character").fuel)
