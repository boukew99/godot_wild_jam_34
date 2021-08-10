extends PopupPanel

onready var transition = $AudioStreamPlayer

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if visible:
			hide()
		else:
			popup()
			transition.play()
	
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		
func _on_Pause_popup_hide():
	get_tree().paused = false


func _on_Pause_about_to_show():
	get_tree().paused = true


func _on_Quit_pressed():
	get_tree().quit()


func _on_TimeScale_value_changed(value):
	Engine.time_scale = value


func _on_Resume_pressed():
	hide()
