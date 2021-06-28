class_name Laser2D
extends Position2D

signal toggled(active)
	
onready var ray_cast = $RayCast2D
onready var line = $Line2D
onready var end = $Line2D/End
onready var sfx = $AudioStreamPlayer

func toggle(active):
	line.visible = active
	ray_cast.enabled = active
	update_line(0) # reset, against popping
	end.emitting = active
	sfx.play() if active else sfx.stop()
	emit_signal("toggled", active)
	
func _physics_process(delta):
	var distance = ray_cast.cast_to.x
	if ray_cast.is_colliding():
		distance = (ray_cast.get_collision_point() - global_position).length()
		var col = ray_cast.get_collider()
		if col.has_method("_on_laser_hit"): col._on_laser_hit()
	
	update_line(distance)

func update_line(distance : float):
	line.points[1].x = distance
	end.position.x = distance
