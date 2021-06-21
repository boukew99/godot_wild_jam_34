extends Laser2D

export var cooldown_time := 0.0
export var active_time := 0.6

onready var cooldown_timer := $CooldownTimer
onready var active_timer = $ActiveTimer

func _ready():
	if cooldown_time: cooldown_timer.wait_time = cooldown_time
	active_timer.wait_time = active_time
	
func shoot():
	if active_timer.is_stopped() and cooldown_timer.is_stopped():
		toggle(true)
		active_timer.start()
	
func _on_ActiveTimer_timeout():
	toggle(false)
	if cooldown_time: cooldown_timer.start()


