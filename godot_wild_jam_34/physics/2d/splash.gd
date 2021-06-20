extends Node

var state = "init"

func _on_Timer_timeout():
	match state:
		"init":
			$AnimationPlayer.play("Write")
		"splash":
			$AnimationPlayer.play("Background")

func _unhandled_key_input(event):
	if !event.is_action_pressed("fullscreen"):
		if state == "init":
			state = "splash"
			$AnimationPlayer.play("Clear")
			$Timer.start()
