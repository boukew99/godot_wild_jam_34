extends Control

export(String, FILE, "*tscn") var next_scene

signal next_scene

onready var animation_player = $AnimationPlayer
onready var start = $TitleBox/Start

func _on_TitleScreen_ready():
	start.grab_focus()
	
func _on_Start_pressed():
	start.disabled = true
	$Start.play()
	$Transition.change_scene()
	


