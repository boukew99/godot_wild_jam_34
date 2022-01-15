extends Control

func _ready():
	$Button.grab_focus()
	$Label7.hint_tooltip = Engine.get_license_text()
	
func _on_Button_pressed():
	$Transition.change_scene()
