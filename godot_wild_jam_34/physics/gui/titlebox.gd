extends VBoxContainer

func _ready():
	$Button1.grab_focus()
	$AnimationPlayer.play("Appear")
