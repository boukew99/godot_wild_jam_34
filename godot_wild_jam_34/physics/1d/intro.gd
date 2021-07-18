extends Control

func _on_Story_story_end():
	$IntroSpaceship/AnimationPlayer.play("fly_off")
