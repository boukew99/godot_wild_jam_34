extends Control

export(String, FILE, "*tscn") var next_scene

signal next_scene

onready var animation_player = $AnimationPlayer
onready var start = $TitleBox/Start

func _ready():
	start.grab_focus()
	
func _on_Start_pressed():
	start.disabled = true
	animation_player.play("fade_out")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(next_scene)
	
