extends Steering

export var rotation_accel := 15 
onready var laser = $Laser
onready var bomb = $BombHatch
onready var nitro = $Nitro

func _physics_process(delta):
	velocity = forward_steer(get_move_direction(), delta)
	
	if velocity:
		rotation = lerp_angle(rotation, velocity.angle(), rotation_accel * delta) #for 180 case, turn off for aiming?
		
	velocity = move_and_slide(velocity)
	
func _unhandled_input(event):
	if event.is_action_pressed("laser"):
		laser.toggle(true)
	elif event.is_action_released("laser"):
		laser.toggle(false)
		
	if event.is_action_pressed("bomb"):
		bomb.release(velocity)
	
	if event.is_action_pressed("nitro"):
		nitro.ignite()
	
		
func get_move_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).clamped(1)
	

