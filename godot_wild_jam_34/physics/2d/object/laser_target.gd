extends StaticBody2D

signal _on_laser_hit

func _on_laser_hit():
	emit_signal("_on_laser_hit")
