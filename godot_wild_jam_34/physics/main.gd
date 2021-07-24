extends Node

export(PackedScene) var intro
export(PackedScene) var game

	
func _on_TitleScreen_next_scene():
	$TitleScreen.queue_free()
	$Intro.show()
	$Intro/Story/Button.grab_focus()
	$Intro/Story.call_ready()
	$Theme1.next()



func _on_Intro_done():
	$Intro.queue_free()
	var g = game.instance()
	add_child(g)
	$Theme1.next()
