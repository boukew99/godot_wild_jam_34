extends Laser2D

func _unhandled_input(event):
	if event.is_action_pressed("laser"):
		line.show()
		ray_cast.enabled = true
		$Timer.start()

func _on_Timer_timeout():
	line.hide()
	ray_cast.enabled = false
