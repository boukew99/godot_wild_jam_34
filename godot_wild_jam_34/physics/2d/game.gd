extends Node2D

export(NodePath) var minimap
export(NodePath) var rooms
onready var slots = $HUD/Slots
onready var cakes = $HUD/Slots/Cakes
var index := 0


func _ready():
	minimap = get_node(minimap)
	rooms = get_node(rooms)
	
func _unhandled_input(event):
	if event.is_action_pressed("mini_map"):
		minimap.show()
		slots.show()
		
	if event.is_action_released("mini_map"):
		minimap.hide()
		slots.hide()
		
func _on_GridCamera2D_position_changed(block_postion):
	minimap.get_child(index).modulate = Color.white
	index = wrapi(block_postion.x, 0, rooms.columns) + wrapi(block_postion.y, 0, rooms.rows) * rooms.columns
	minimap.get_child(index).modulate = Color.darkgray

func add_cake():
	cakes.rect_size.x += 16
	if cakes.rect_size.x == 10 * 16:
		get_tree().call_group("loop_music", "stop")
		$AllCollected.play()
		$Credits/ReferenceRect/AllCakes.show()
		$Space/SpaceShip/Camera2D.current = true
		$Space/SpaceShip/GridCamera2D.queue_free()
		
