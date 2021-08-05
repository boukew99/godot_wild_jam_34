class_name TimedLaser2D
extends Laser2D

onready var cooldown_timer := $CooldownTimer
onready var active_timer = $ActiveTimer

func shoot():
	if active_timer.is_stopped() and cooldown_timer.is_stopped():
		toggle(true)
		active_timer.start()

func stop_shoot():
	toggle(false)
	active_timer.stop()
	
func _on_ActiveTimer_timeout():
	toggle(false)
	cooldown_timer.start()


