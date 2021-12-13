tool
extends Area2D

export(String, FILE, "*.tscn") var room_path

func _ready():
	$Label.text = room_path.get_file()
	
func _on_RoomTransfer_body_entered(body):
	$CanvasLayer/Transition.change_scene()
