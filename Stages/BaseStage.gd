extends Node2D

onready var GUI = $GUI
var viewport = Vector2.ZERO
var midScreen : float

func _ready():
	viewport = get_viewport_rect().size
	midScreen = viewport.x / 2
	$GUI/Position.position = Vector2(midScreen, 0)

func _process(delta):
	GUI.get_node("Fuel").text = str(int(get_tree().current_scene.get_node("Character").fuel))
