extends Node

var index := 0

export(NodePath) var rooms
export(NodePath) var minimap

func _ready():
	rooms = get_node(rooms)
	minimap = get_node(minimap) as GridContainer
	
func _on_GridCamera2D_position_changed(block_postion):
	minimap.get_child(index).modulate.r = 1
	index = wrapi(block_postion.x, 0, rooms.columns) + wrapi(block_postion.y, 0, rooms.rows) * rooms.columns
	minimap.get_child(index).modulate.r = 0.5
	
