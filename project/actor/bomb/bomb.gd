extends Steering

func _ready():
	$AudioStreamPlayer.play()
func _physics_process(delta):
	velocity = forward_steer(Vector2.ZERO, delta)
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
	
func _on_Detonate_timeout():
	$AnimationPlayer.play("BOOM")
	get_tree().call_group("camera", "add_trauma", 0.1)

func _on_laser_hit():
	$Detonate.stop()
	_on_Detonate_timeout()
	


func _on_Area2D_body_entered(body):
	if body.has_method("_on_laser_hit"):
		body._on_laser_hit()
