extends Area2D

onready var character = get_parent().get_node("Character")
onready var sprite = $Sprite
onready var animation = $AnimationPlayer

var totalFuel : float = 40
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
	_animation()
	if(charIn and character.is_on_floor()):
		if(character.fuel < character.maxFuel and fuel > 0):
			animation.play("Filling")
			character.fuel += 0.5
			fuel -= 0.5
		else:
			animation.play("Idle")
	else:
		animation.play("Idle")

func _animation():
	if(fuel < 31):
		sprite.frame = 1
		if(fuel < 21):
			sprite.frame = 2
			if(fuel < 11):
				sprite.frame = 3
				if(fuel < 1):
					sprite.frame = 4
	else:
		sprite.frame = 0
