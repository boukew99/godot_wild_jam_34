extends Area2D




func _on_Guard_body_entered(body):
	if body.is_in_group("player"):
		$FollowShip.target = body


func _on_Guard_body_exited(body):
	if body.is_in_group("player"):
		$FollowShip.target = self
