extends Area2D

enum ITEMS {CARROTCAKE, CARROT}
export(ITEMS) var item

func _on_Pickup_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("pickup")
