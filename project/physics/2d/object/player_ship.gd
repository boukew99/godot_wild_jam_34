extends Steering

export var rotation_accel := 15 
onready var laser = $TimedLaser
onready var bomb = $BombHatch
onready var nitro = $Nitro
onready var engine = $Engine

func _physics_process(delta):
	var move_dir = get_move_direction()
	if engine.playing and not move_dir: engine.stop()
	elif not engine.playing and move_dir: engine.play()
	velocity = forward_steer(move_dir, delta)
	
	if velocity:
		rotation = lerp_angle(rotation, velocity.angle(), rotation_accel * delta) #for 180 case
		engine.volume_db = linear2db(1 -(speed -velocity.length()) / speed)
		
	velocity = move_and_slide(velocity)
	
func _unhandled_input(event):
	if event.is_action_pressed("laser"):
		laser.shoot()
	elif event.is_action_released("laser"):
		laser.stop_shoot()
#
	if event.is_action_pressed("bomb"):
		bomb.release(velocity)
#
	if event.is_action_pressed("nitro"):
		nitro.ignite()
	
		
func get_move_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).clamped(1)


onready var sfx = $TimedLaser/AudioStreamPlayer

func _on_TimedLaser_toggled(active):
	sfx.play() if active else sfx.stop()