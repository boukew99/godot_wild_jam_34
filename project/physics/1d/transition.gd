extends Control

export(String, FILE, "*.tscn") var next_scene
export var scene_name = ""
export var fade_in = true
export var fade_out = false

func _ready():
#	$Label.text = get_tree().current_scene.name
	$Label.text = scene_name
	if fade_in:
		$AnimationPlayer.play("fade_in")
	else:
		hide()
		
func change_scene():
	if fade_out:
		var anim = $AnimationPlayer
		anim.play("fade_out")
		yield(anim, "animation_finished")
	get_tree().change_scene(next_scene)
