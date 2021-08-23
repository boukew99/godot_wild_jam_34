extends Control

func _on_TitleScreen_ready():
	$Start.grab_focus()
	
func _on_Start_pressed():
	$MainMenu.popup_centered()
	

func _on_New_pressed():
	$Transition.change_scene()

func _on_Fullscreen_pressed():
	OS.window_fullscreen = not OS.window_fullscreen
	
func _on_About_pressed():
	$About.popup_centered()

func _on_Quit_pressed():
	get_tree().quit()




