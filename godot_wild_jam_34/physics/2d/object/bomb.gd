extends Steering

func _physics_process(delta):
	velocity = forward_steer(Vector2.ZERO, delta)
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
	
func _on_Detonate_timeout():
	$AnimationPlayer.play("BOOM")
