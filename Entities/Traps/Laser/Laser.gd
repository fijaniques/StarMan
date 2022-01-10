extends Area2D

var speed = 800
var direction = Vector2.ZERO

var damage : int = 1

func _physics_process(delta):
	position.y -= speed * delta

func _on_Laser_body_entered(body):
	queue_free()
