extends PopupPanel

export(String, FILE, "*.tscn") var next_scene
export var fade_in = true
export var fade_out = false

func _ready():
	get_tree().paused = false
	if fade_in:
		show() #popup()
		$AnimationPlayer.play("fade_in")
		yield($AnimationPlayer, "animation_finished")
#		AudioServer.set_bus_effect_enabled(0,0, false)
	else:
		hide()

func change_scene():
	if fade_out:
		var anim = $AnimationPlayer
		anim.play("fade_out")
		get_tree().paused = true
		yield(anim, "animation_finished")
		
#	AudioServer.set_bus_effect_enabled(0,0, true)
	get_tree().change_scene(next_scene)
