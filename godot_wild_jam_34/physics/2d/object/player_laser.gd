extends Laser2D

onready var timer = $Timer

func _unhandled_input(event):
	if event.is_action_pressed("laser") and timer.is_stopped():
		line.show()
		ray_cast.enabled = true
		timer.start()

func _on_Timer_timeout():
	line.hide()
	ray_cast.enabled = false
