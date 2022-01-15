extends Steering

export var rotation_accel := 15 
onready var laser = $TimedLaser
onready var bomb = $BombHatch
onready var nitro = $Nitro
onready var engine = $Engine

func _physics_process(delta):
	var move_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
#	if engine.playing and not move_dir: engine.stop()
#	elif not engine.playing and move_dir: engine.play()
	print(move_dir)
	velocity = forward_steer(move_dir, delta)
	
	if velocity:
		rotation = lerp_angle(rotation, velocity.angle(), rotation_accel * delta) #for 180 case
		engine.volume_db = linear2db(1 -(speed -(velocity.length() * (1 + move_dir.length()) /2)) / speed)

	velocity = move_and_slide(velocity)
	
#func _unhandled_input(event):
#	if event.is_action_pressed("laser"):
#		laser.shoot()
#	elif event.is_action_released("laser"):
#		laser.stop_shoot()
##
#	if event.is_action_pressed("bomb"):
#		bomb.release(velocity)
##
#	if event.is_action_pressed("nitro"):
#		nitro.ignite()
	


onready var sfx = $TimedLaser/AudioStreamPlayer

func _on_TimedLaser_toggled(active):
	sfx.play() if active else sfx.stop()


func _on_Bomb_pressed():
	bomb.release(velocity)


func _on_Nitro_pressed():
	nitro.ignite()



func _on_Laser_button_down():
	laser.shoot()


func _on_Laser_button_up():
	laser.stop_shoot()

