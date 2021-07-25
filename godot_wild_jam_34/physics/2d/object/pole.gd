extends StaticBody2D

signal toggled(active)

onready var timer = $Timer
onready var polygon = $Polygon2D
onready var collision_shape = $CollisionShape2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		timer.start()
		polygon.color = Color(0.6, 0.458824, 0.466667)
		collision_shape.disabled = true
		emit_signal("toggled", true)
		
		
func _on_Timer_timeout():
	polygon.color = Color(0.203922, 0.25098, 0.337255)
	emit_signal("toggled", false)
	collision_shape.disabled = false
