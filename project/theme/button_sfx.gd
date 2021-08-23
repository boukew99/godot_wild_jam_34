extends AudioStreamPlayer

func _ready():
	for node in get_tree().get_nodes_in_group("pressed_sfx"):
		node.connect("pressed", self, "play")
