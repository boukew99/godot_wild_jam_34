extends Node

var index := 0

export(NodePath) var rooms
export(NodePath) var minimap

func _ready():
	rooms = get_node(rooms)
	minimap = get_node(minimap) as GridContainer
	get_tree().paused = true
	$TitleLayer/Titlescreen.grab_focus()
	
func _on_GridCamera2D_position_changed(block_postion):
	minimap.get_child(index).modulate = Color.white
	index = wrapi(block_postion.x, 0, rooms.columns) + wrapi(block_postion.y, 0, rooms.rows) * rooms.columns
	minimap.get_child(index).modulate = Color.darkgray
	

func _unhandled_input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen


func _on_Titlescreen_pressed():
	$TitleLayer.queue_free()
	get_tree().paused = false
