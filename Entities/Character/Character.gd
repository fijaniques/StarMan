extends KinematicBody2D

const UP = Vector2.UP
onready var Pos2d = get_tree().current_scene.get_node("GUI/Position")
var laser = preload("res://Entities/Traps/Laser/Laser.tscn")

#MOVEMENT
var gravity : float = 1000
var speed : float = 100
var flyForce : float = -50
var flySpeed : float = -500
var jumpForce : float = -500
var velocity = Vector2.ZERO
var hp : int = 1

var hVelocity : float = 0

var touching : bool = false
var touchPos = Vector2.ZERO

#FUEL
var fuel : float
var maxFuel : float = 40

func _ready():
	fuel = maxFuel

func _physics_process(delta : float) -> void:
	_motion(delta)
	_fly()
	_jump()
	_touch_input()
	_handle_hp()

func _motion(delta : float):
	velocity.x = (touchPos.x / 200) * speed
	if(velocity.y < gravity):
		velocity.y += gravity * delta 
	else:
		velocity.y = gravity
	
	velocity = move_and_slide(velocity, UP)

func _jump():
	if(fuel <0):
		if(Input.is_action_just_pressed("mouse") and is_on_floor()):
			velocity.y = jumpForce

func _fly():
	if(Input.is_action_pressed("mouse") and fuel > 0):
		fuel -= 0.2
		if(velocity.y > flySpeed):
			velocity.y += flyForce
		else:
			velocity.y = flySpeed

func _touch_input():
	if(Input.is_action_pressed("mouse")):
		touching = true
		touchPos.x = get_global_mouse_position().x - Pos2d.position.x
	else:
		touching = false
		touchPos.x = 0

func _handle_hp():
	if(hp <= 0):
		get_tree().reload_current_scene()

func _on_PlayerArea_area_entered(area):
	if(area.is_in_group("Traps")):
		hp -= 1
	
	if(area.name == "Exit"):
		get_tree().reload_current_scene()
