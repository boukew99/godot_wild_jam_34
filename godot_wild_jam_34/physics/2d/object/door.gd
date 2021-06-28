extends StaticBody2D

onready var collsion_shape = $CollisionShape2D
onready var line = $Line2D

func on_toggle(active):
	collsion_shape.disabled = active
	line.visible = not active
	$On.play() if active else $Off.play()
