extends Sprite

var canCollide : bool

func _physics_process(delta):
	if($RayCast2D.is_colliding()):
		if(canCollide):
			print("OBA")
			canCollide = false
	else:
		canCollide = true
	
func _shoot_laser():
	pass

