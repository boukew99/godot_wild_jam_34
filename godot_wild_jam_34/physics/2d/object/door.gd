extends StaticBody2D

onready var collsion_shape = $CollisionShape2D

func on_toggle(active):
	collsion_shape.disabled = active

