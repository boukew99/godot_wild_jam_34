extends Popup

	
func _unhandled_input(event):
	if not visible and event.is_action_pressed("pause"):
		popup()
	
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
	
func _on_New_pressed():
	hide()

func _on_Fullscreen_pressed():
	OS.window_fullscreen = not OS.window_fullscreen
	

func _on_Quit_pressed():
	get_tree().quit()


func _on_TitleScreen_about_to_show():
	get_tree().paused = true
	AudioServer.set_bus_effect_enabled(2, 0, true) #low pass filter


func _on_TitleScreen_popup_hide():
	get_tree().paused = false
	AudioServer.set_bus_effect_enabled(2, 0, false) #low pass filter

func _on_Credits_pressed():
	$Transition.change_scene()


func _on_Next_pressed():
	var tabs = $Story/TabContainer
	tabs.current_tab += 1
	if tabs.current_tab == tabs.get_child_count() - 1:
		$Story.hide()




func _on_Story_pressed():
	$Story.popup()
	$Story/TabContainer.current_tab = 0
