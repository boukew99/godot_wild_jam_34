extends Control

signal done
onready var anim = $AnimationPlayer

func _ready():
	$Story/Button.grab_focus()
	$Story.call_ready()
	
func _on_Story_story_end():
	anim.play("fly_off")
	yield(anim, "animation_finished")
	$Transition.change_scene()
