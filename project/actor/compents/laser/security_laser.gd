extends TimedLaser2D

onready var offset = wrapf(position.length(), 1, 5)

func _ready():
	yield(get_tree().create_timer(offset), "timeout")
	shoot()
	
func _on_CooldownTimer_timeout():
	shoot()
