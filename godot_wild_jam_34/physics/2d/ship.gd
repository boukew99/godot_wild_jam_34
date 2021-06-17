extends KinematicBody2D
class_name Ship

export(Vector2) var velocity : Vector2 #starting velocity, .length() holds current speed

var steering : Vector2

export(float) var acceleration = 2
export(float) var de_acceleration = 0.6
export(float) var speed : int = 500 #max_speed	
	
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
