extends Node

export(PackedScene) var game

	
func _on_TitleScreen_next_scene():
	$TitleScreen.queue_free()
	var g = game.instance()
	add_child(g)
	$Theme1.next()
