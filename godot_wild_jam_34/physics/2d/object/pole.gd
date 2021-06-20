extends StaticBody2D

onready var timer = $Timer

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		timer.start()
		modulate = Color.red


func _on_Timer_timeout():
	modulate = Color.white
