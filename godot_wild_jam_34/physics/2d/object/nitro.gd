extends Position2D

export var speed_boost := 100
export var control_loss := -1 # TODO

onready var cooldown_timer := $CooldownTimer
onready var active_timer = $ActiveTimer
onready var parent = get_parent() # better have Steering

func toggle(active):
	$CPUParticles2D.emitting = active
	parent.speed += speed_boost if active else -speed_boost
	
func ignite():
	if active_timer.is_stopped() and cooldown_timer.is_stopped():
		toggle(true)
		active_timer.start()
		
	
func _on_ActiveTimer_timeout():
	toggle(false)
	cooldown_timer.start()
