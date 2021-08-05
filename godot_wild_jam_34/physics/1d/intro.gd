extends Control

export(String, FILE, "*tscn") var next_scene

signal done
onready var anim = $AnimationPlayer

func _ready():
	show()
	$Story/Button.grab_focus()
	$Story.call_ready()
	
func _on_Story_story_end():
	anim.play("fly_off")
	yield(anim, "animation_finished")
	get_tree().change_scene(next_scene)


func _on_Intro_visibility_changed():
	anim.play("fade_in")
