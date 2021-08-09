extends Control

signal done
onready var anim = $AnimationPlayer

func _ready():
	$Label/Button.grab_focus()

func _on_Button_pressed():
	anim.play("fly_off")
	$Transition.change_scene()
