extends Area2D

onready var character = get_parent().get_node("Character")

var totalFuel : float = 30
var fuel: float

var charIn : bool = false

func _ready():
	fuel = totalFuel

func _process(delta):
	_filling()

func _on_FuelPump_area_entered(area):
	charIn = true

func _on_FuelPump_area_exited(area):
	charIn = false

func _filling():
	if(charIn and character.is_on_floor()):
		if(character.fuel < character.maxFuel and fuel > 0):
			print(fuel)
			character.fuel += 0.5
			fuel -= 0.5
