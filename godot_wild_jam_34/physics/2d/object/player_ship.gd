extends Steering

export var rotation_accel := 15 
onready var laser = $TimedLaser
onready var bomb = $BombHatch

func _physics_process(delta):
	velocity = forward_steer(get_direction(), delta)
		
	if velocity:
		rotation = lerp_angle(rotation, velocity.angle(), rotation_accel * delta) #for 180 case, turn off for aiming?
	velocity = move_and_slide(velocity)
	
func _unhandled_input(event):
	if event.is_action_pressed("laser"):
		laser.shoot()
	elif event.is_action_pressed("bomb"):
		bomb.release(velocity)
		
func get_direction():
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).clamped(1)
	
