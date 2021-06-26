extends TimedLaser2D

onready var offset = rand_range(0, 7) # pattern-based

func _ready():
	if offset: yield(get_tree().create_timer(offset), "timeout")
	shoot()
	
func _on_CooldownTimer_timeout():
	shoot()
