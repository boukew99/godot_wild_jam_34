extends Area2D


func _on_NextLoop_body_entered(body):
	get_tree().root.get_node("main/LoopBackPlayer").next()
	queue_free()
