extends Node

var state = "init"
const res_titlebox = preload("res://physics/gui/titlebox.tscn")

func _on_Timer_timeout():
	match state:
		"init":
			$AnimationPlayer.play("PromptKey")
		"splash":
			$AnimationPlayer.play("Background")

func _unhandled_key_input(event):
	if !event.is_action_pressed("fullscreen"):
		if state == "init":
			state = "splash"
			$AnimationPlayer.play("Clear")
			$Timer.start()

func draw_titlebox():
	var box = res_titlebox.instance()
	add_child(box)
	
