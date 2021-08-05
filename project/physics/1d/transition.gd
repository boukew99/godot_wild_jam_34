extends Control

export(String, FILE, "*.tscn") var next_scene

func change_scene():
	var anim = $AnimationPlayer
	anim.play("fade_out")
	yield(anim, "animation_finished")
	get_tree().change_scene(next_scene)
