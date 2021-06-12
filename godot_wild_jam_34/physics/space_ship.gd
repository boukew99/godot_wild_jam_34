extends KinematicBody2D

var gas := false
export var rotation_accel := 15 #

export(Vector2) var velocity : Vector2 #starting velocity, .length() holds current speed

var steering : Vector2

export(float) var acceleration = 2
export(float) var de_acceleration = 0.6
export(float) var speed : int = 500 #max_speed

func _physics_process(delta):
	velocity = forward_steer(get_direction() + transform.x * int(gas), delta)
	if Input.is_action_just_pressed("gas"): #dash
		velocity += transform.x * 100
	if velocity:
		rotation = lerp_angle(rotation, velocity.angle(), rotation_accel * delta) #for 180 case, turn off for aiming?
	move_and_slide(velocity)

func get_direction():
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).clamped(1)
	
	
func forward_steer(steer_direction : Vector2, delta : float): #no clamp safety
	steering = steer_direction * speed
	var next_velocity : Vector2

	if not steer_direction: #steering.dot(velocity) <= 0: #de_accelerate / stop when steering backwards or no steering
		next_velocity = velocity.linear_interpolate(steering, de_acceleration * delta)
		if velocity.length() < 5: #and not steer_direction
			next_velocity = Vector2.ZERO
	else: #accelerate
		next_velocity = velocity.linear_interpolate(steering, acceleration * delta)

#	print(next_velocity.length()) #test velocity speed
	return next_velocity
