extends VBoxContainer

signal start_game
signal popup

func _ready():
	$Button1.grab_focus()
	$AnimationPlayer.play("Appear")

func _on_Button1_pressed():
	emit_signal("start_game")

func _on_Button2_pressed():
	emit_signal("popup", "controls")

func _on_Button3_pressed():
	emit_signal("popup", "credits")
