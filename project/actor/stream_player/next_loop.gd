extends Area2D


func _on_NextLoop_body_entered(body):
	get_tree().call_group("loop_music", "next")
	queue_free()
