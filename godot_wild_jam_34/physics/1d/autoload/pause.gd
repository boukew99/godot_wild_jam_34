extends PopupPanel

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if visible:
			hide()
		else:
			popup()
		
func _on_Pause_popup_hide():
	get_tree().paused = false


func _on_Pause_about_to_show():
	get_tree().paused = true
