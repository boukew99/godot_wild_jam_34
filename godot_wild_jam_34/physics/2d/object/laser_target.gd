extends StaticBody2D


export var active_time := 10.0 # 0 = not timer
signal on_toggle(active)
onready var timer = $Timer
onready var animation_player = $AnimationPlayer

func _ready():
	if active_time: timer.wait_time = active_time
	
func _on_laser_hit():
	if timer.is_stopped():
		emit_signal("on_toggle", true)
		animation_player.play("Green")
		if active_time: timer.start()
			

func _on_Timer_timeout():
	emit_signal("on_toggle", false)
	animation_player.play("Red")
