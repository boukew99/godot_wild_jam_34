extends VisibilityNotifier2D


export(PackedScene) var scene

func _on_VisibilityInstancer_screen_entered():
	add_child(scene.instance())


func _on_VisibilityInstancer_screen_exited():
	get_child(0).queue_free()
