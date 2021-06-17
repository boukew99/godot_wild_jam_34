extends Node

export(PackedScene) var game

func _unhandled_input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen

func _on_BootCatch_pressed():
	$Intro/AnimationPlayer.play("acts")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	var g = game.instance()
	add_child(g)
	
