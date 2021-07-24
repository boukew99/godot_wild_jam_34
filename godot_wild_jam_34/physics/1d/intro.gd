extends Control

signal done
onready var anim = $AnimationPlayer

func _on_Story_story_end():
	anim.play("fly_off")
	yield(anim, "animation_finished")
	emit_signal("done")


func _on_Intro_visibility_changed():
	anim.play("fade_in")
