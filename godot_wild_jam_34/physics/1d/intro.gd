extends Node2D

var ship_velocity = 300
var camera_velocity = 100
var is_decel = true
var is_accel = false
var is_changing_scene = false

signal change_scene

func _ready():
	for node in $Galaxy.get_children():
		if "modulate" in node:
			node.modulate.a = 0
	$Galaxy/AnimationPlayer.play("FadeIn")
	$CanvasLayer/Story.connect("story_end", self, "on_story_end")

func _process(delta):
	if is_decel:
		ship_velocity -= 0.5
		if ship_velocity == 100:
			is_decel = false
	if is_accel:
		ship_velocity += 6
		camera_velocity += 2
	$IntroSpaceship.position.x += ship_velocity * delta
	$Camera2D.position.x += camera_velocity * delta

func _on_Timer_timeout():
	if !is_changing_scene:
		$Galaxy/AnimationPlayer.play("FadeOut")
		$Timer.wait_time = 1.6
		is_changing_scene = true
		$Timer.start()
	else:
		emit_signal("change_scene", "game")

func on_story_end():
	$Timer.start()
	is_accel = true
	
