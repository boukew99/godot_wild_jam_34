extends StaticBody2D

func _on_laser_hit():
	queue_free()
