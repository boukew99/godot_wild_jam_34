extends StaticBody2D

onready var collsion_shape = $CollisionShape2D

func open():
	collsion_shape.disabled = true
	
func close():
	collsion_shape.disabled = false
