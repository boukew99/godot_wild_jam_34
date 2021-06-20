extends StaticBody2D

onready var timer = $Timer
onready var polygon = $Polygon2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		timer.start()
		polygon.color = Color(0.6, 0.458824, 0.466667)

func _on_Timer_timeout():
	polygon.color = Color(0.203922, 0.25098, 0.337255)
