extends Node2D

onready var minimap = $HUD/MiniMap
onready var rooms = $Rooms
onready var slots = $HUD/Slots
onready var cakes = $HUD/Slots/Cakes
var index := 0

func _unhandled_input(event):
	if event.is_action_pressed("mini_map"):
		slots.show()
		
	if event.is_action_released("mini_map"):
		slots.hide()
		
func _on_GridCamera2D_position_changed(block_postion):
	minimap.get_child(index).modulate = Color.white
	index = wrapi(block_postion.x, 0, rooms.columns) + wrapi(block_postion.y, 0, rooms.rows) * rooms.columns
	minimap.get_child(index).modulate = Color.darkgray

func add_cake():
	cakes.rect_size.x += 16
	if cakes.rect_size.x == 10 * 16:
		$Credits/ReferenceRect/AllCakes.show()
		yield(get_tree().create_timer(5), "timeout")
		$CanvasLayer/Transition.change_scene()
		
