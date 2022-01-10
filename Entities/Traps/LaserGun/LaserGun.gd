extends Sprite

var laser = preload("res://Entities/Traps/Laser/Laser.tscn")
var canCollide : bool

func _physics_process(delta):
	if($RayCast2D.is_colliding()):
		if(canCollide):
			_shoot_laser()
			canCollide = false
	else:
		canCollide = true
	
func _shoot_laser():
	var laserInstance = laser.instance()
	add_child(laserInstance)
	laserInstance.position = $Position2D.position
	var new_parent = get_tree().current_scene
	get_parent().remove_child(self)
	new_parent.add_child(self)
