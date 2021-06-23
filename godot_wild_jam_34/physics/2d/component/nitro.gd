extends Position2D

export var speed_boost := 4
export var control_loss := -1 # TODO

onready var cooldown_timer := $CooldownTimer
onready var active_timer = $ActiveTimer
onready var parent = get_parent() # better have Steering

func _ready():
	set_physics_process(false)
	
func toggle(active):
	$CPUParticles2D.emitting = active
	set_physics_process(active)

func _physics_process(delta):
	parent.velocity += global_transform.x * speed_boost
	
func ignite():
	if active_timer.is_stopped() and cooldown_timer.is_stopped():
		toggle(true)
		active_timer.start()
		
	
func _on_ActiveTimer_timeout():
	toggle(false)
	cooldown_timer.start()
