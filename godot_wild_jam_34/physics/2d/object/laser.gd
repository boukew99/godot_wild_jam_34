extends Position2D

onready var ray_cast = $RayCast2D
onready var line = $Line2D
onready var end = $Line2D/End

func _unhandled_input(event):
	if event.is_action_pressed("laser"):
		line.show()
		ray_cast.enabled = true
		$Timer.start()
		
func _physics_process(delta):
	var distance = ray_cast.cast_to.x
	if ray_cast.is_colliding():
		distance = (ray_cast.get_collision_point() - global_position).length()
		var col = ray_cast.get_collider()
		if col.has_method("_on_laser_hit"): col._on_laser_hit()

	line.points[1].x = distance
	end.position.x = distance



func _on_Timer_timeout():
	line.hide()
	ray_cast.enabled = false
