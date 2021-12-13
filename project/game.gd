extends Node

onready var minimap = $CanvasLayer/MiniMap
onready var slots = $CanvasLayer/Slots
onready var cakes = $CanvasLayer/Slots/Cakes
var index := 0

		
func _on_GridCamera2D_position_changed(block_postion):
	minimap.get_child(index).modulate = Color.white
	index = wrapi(block_postion.x, 0, 6) + wrapi(block_postion.y, 0, 7) * 6
	minimap.get_child(index).modulate = Color.darkgray

func add_cake():
	cakes.rect_size.x += 16
	if cakes.rect_size.x == 10 * 16:
		$Credits/ReferenceRect/AllCakes.show()
		yield(get_tree().create_timer(5), "timeout")
		$CanvasLayer/Transition.change_scene()
		


func _on_LaserTarget16_on_toggle(active):
	$AudioStreamPlayer.pitch_scale = pow(2, 2.0 / 12)
