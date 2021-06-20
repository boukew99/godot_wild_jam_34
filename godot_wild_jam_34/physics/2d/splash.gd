extends Node2D

var state = "init"
const res_titlebox = preload("res://physics/gui/titlebox.tscn")

signal start_game

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
	box.connect("start_game", self, "start_game")
	box.connect("popup", self, "draw_popup")
	add_child(box)
	
func start_game():
	emit_signal("start_game")

func draw_popup(window):
	match window:
		"controls":
			pass
		"credits":
			pass
