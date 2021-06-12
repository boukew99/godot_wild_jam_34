extends Node

var index := 0
export(NodePath) var minimap

func _ready():
	minimap = get_node(minimap) as GridContainer
	
func _on_GridCamera2D_position_changed(block_postion):
	print(block_postion)
	minimap.get_child(index).modulate.r = 1
	index = wrapi(block_postion.x, 0, 2) + wrapi( block_postion.y  , 0, 2) * 2
	minimap.get_child(index).modulate.r = 0.5
	
