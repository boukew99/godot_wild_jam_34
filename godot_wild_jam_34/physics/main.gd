extends Node

export(Array, PackedScene) var scenes

func _unhandled_input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen

func _on_TitleScreen_next_scene():
	$TitleScreen.queue_free()
	$Intro.show()
	$Intro/Story/Button.grab_focus()
	$Intro/Story.call_ready()
	$Theme1.next()

func _on_Intro_done():
	$Intro.queue_free()
	var g = scenes.pop_back().instance()
	add_child(g)
	
	$Theme1.next()


