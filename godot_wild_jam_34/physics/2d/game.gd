extends Node2D

export(NodePath) var minimap
export(NodePath) var rooms
var index := 0

func _ready():
	minimap = get_node(minimap)
	rooms = get_node(rooms)
	
func _on_GridCamera2D_position_changed(block_postion):
	minimap.get_child(index).modulate = Color.white
	index = wrapi(block_postion.x, 0, rooms.columns) + wrapi(block_postion.y, 0, rooms.rows) * rooms.columns
	minimap.get_child(index).modulate = Color.darkgray
