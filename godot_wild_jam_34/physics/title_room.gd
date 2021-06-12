extends Control

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$TileMap.queue_free()
		$Title/Area2D.queue_free()
		$Title.modulate = Color.red
