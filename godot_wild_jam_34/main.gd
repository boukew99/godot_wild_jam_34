extends Node

export(PackedScene) var game
const scene_game = preload("res://physics/2d/game.tscn")
const scene_intro = preload("res://physics/gui/intro.tscn")

var current_scene

func _ready():
	current_scene = $Splash

func _unhandled_input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen

func _on_BootCatch_pressed():
	$Intro/AnimationPlayer.play("acts")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	var g = game.instance()
	add_child(g)
	
func switch_scene(scene_res):
	var newscene
	match scene_res:
		"intro":
			newscene = scene_intro.instance()
		"game":
			newscene = scene_game.instance()
	newscene
	add_child(newscene)
