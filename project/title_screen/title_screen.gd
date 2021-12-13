extends Popup

func _ready():
	popup()
	
func _unhandled_input(event):
	if not visible and event.is_action_pressed("pause"):
		popup()
	
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		
func _on_TitleScreen_ready():
	$HBoxContainer/Fullscreen.grab_focus()
	
func _on_New_pressed():
	hide()

func _on_Fullscreen_pressed():
	OS.window_fullscreen = not OS.window_fullscreen
	

func _on_Quit_pressed():
	get_tree().quit()


func _on_TitleScreen_about_to_show():
	get_tree().paused = true
	$Transition.play() # or low-pass filter


func _on_TitleScreen_popup_hide():
	get_tree().paused = false
	$Transition.play() # or low-pass filter


func _on_Credits_pressed():
	$Transition2.change_scene()
