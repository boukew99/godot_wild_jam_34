extends VBoxContainer


func _on_CheckButton_toggled(button_pressed):
	$AudioStreamPlayer.volume_db = 0 if button_pressed else -80


func _on_CheckButton2_toggled(button_pressed):
	$AudioStreamPlayer2.volume_db = 0 if button_pressed else -80


func _on_CheckButton3_toggled(button_pressed):
	$AudioStreamPlayer3.volume_db = 0 if button_pressed else -80


func _on_CheckButton4_toggled(button_pressed):
	$AudioStreamPlayer4.volume_db = 0 if button_pressed else -80


func _on_CheckButton5_toggled(button_pressed):
	$AudioStreamPlayer5.volume_db = 0 if button_pressed else -80
