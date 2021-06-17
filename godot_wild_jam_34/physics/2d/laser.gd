extends Position2D

onready var ray_cast = $RayCast2D
onready var line = $Line2D

func _unhandled_input(event):
	if event.is_action_pressed("laser"):
		line.show()
		ray_cast.enabled = true
		$Timer.start()
		
func _physics_process(delta):
	if ray_cast.is_colliding():
		line.points[1].x = (ray_cast.get_collision_point() - global_position).length()
	else:
		line.points[1].x = ray_cast.cast_to.x


func _on_Timer_timeout():
	line.hide()
	ray_cast.enabled = false
