extends Position2D

export(PackedScene) var bomb
export var stop_imprecision = 0.2
onready var owner_parent = owner.get_parent()

func release(velocity):
	var b = bomb.instance()
	owner_parent.add_child(b)
	b.velocity = velocity * stop_imprecision
	b.position = global_position

