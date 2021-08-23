extends Popup

onready var transition = $AudioStreamPlayer


func _unhandled_input(event):
	if not visible and event.is_action_pressed("pause"):
		popup()
	
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen


func _on_Resume_pressed():
	hide()


func _on_PausePopup_about_to_show():
	get_tree().paused = true
	transition.play() # or low-pass filter


func _on_PausePopup_popup_hide():
	get_tree().paused = false

	
func _on_Quit_pressed():
	get_tree().quit()

