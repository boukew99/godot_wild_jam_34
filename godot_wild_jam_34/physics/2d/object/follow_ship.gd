extends Steering

var target = null
export var rotation_accel := 15

func _ready():
	position = global_position 
	set_as_toplevel(true)
	
func _physics_process(delta):
	if target:
		velocity = forward_steer((target.global_position - position).normalized(), delta)
		if velocity:
			rotation = lerp_angle(rotation, velocity.angle(), rotation_accel * delta) #for 180 case, turn off for aiming?
	velocity = move_and_slide(velocity)
