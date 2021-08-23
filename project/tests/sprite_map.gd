extends Node2D


func _on_Area2D_body_entered(body):
	$CanvasModulate/AnimationPlayer.play("fade_in")


func _on_Area2D_body_exited(body):
	$CanvasModulate/AnimationPlayer.play("fade_out")
