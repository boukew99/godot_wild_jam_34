extends Node

export(PackedScene) var game
const scene_game = preload("res://physics/2d/game.tscn")
const scene_intro = preload("res://physics/gui/intro.tscn")

var current_scene
var next_scene

func _ready():
	current_scene = $Splash
	current_scene.connect("start_game", self, "start_game")

func _unhandled_input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen

func _on_BootCatch_pressed():
	$Intro/AnimationPlayer.play("acts")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	var g = game.instance()
	add_child(g)
	
func switch_scene(scene_res):
	var new_scene
	match scene_res:
		"intro":
			new_scene = scene_intro.instance()
			new_scene.connect("change_scene", self, "switch_scene")
		"game":
			new_scene = scene_game.instance()
	next_scene = new_scene
	$Tween.interpolate_property(current_scene, "modulate", 
		Color(1, 1, 1, 1), Color(1, 1, 1, 0), 
		0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	if current_scene != next_scene:
		add_child(next_scene)
		next_scene.modulate.a = 0
		current_scene.queue_free()
		current_scene = next_scene
		$Tween.interpolate_property(current_scene, "modulate", 
			Color(1, 1, 1, 0), Color(1, 1, 1, 1), 
			0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		$Tween.start()

func start_game():
	switch_scene("intro")
