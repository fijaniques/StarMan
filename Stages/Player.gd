extends KinematicBody2D

const UP = Vector2.UP

var gravity : float = 1000
var speed : float = 100
var flyForce : float = -50
var flySpeed : float = -500
var velocity = Vector2.ZERO

func _physics_process(delta : float) -> void:
	_motion(delta)
	_fly()
	
	$CanvasLayer/Text.text = str(velocity.y)

func _motion(delta : float):
	var hDir = Input.get_action_strength("d") - Input.get_action_strength("a")
	velocity.x = hDir * speed 
	if(velocity.y < gravity):
		velocity.y += gravity * delta 
	else:
		velocity.y = gravity
	
	velocity = move_and_slide(velocity, UP)

func _fly():
	if(Input.is_action_pressed("w")):
		if(velocity.y > flySpeed):
			velocity.y += flyForce
		else:
			velocity.y = flySpeed
