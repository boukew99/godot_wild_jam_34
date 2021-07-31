extends Button

export(String, FILE, "*.tscn") var room_path

func _ready():
	text = room_path.get_file()
	
func _on_ChangeScene_pressed():
	get_tree().change_scene(room_path)


