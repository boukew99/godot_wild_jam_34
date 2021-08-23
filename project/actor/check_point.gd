extends Area2D

var active := false

func _on_CheckPoint_body_entered(body):
	if body.is_in_group("player"):
		get_tree().set_group("checkpoint", "active", false)
		active = true

