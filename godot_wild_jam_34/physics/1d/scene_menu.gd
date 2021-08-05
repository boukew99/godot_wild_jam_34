extends MenuButton

export(Array, String, FILE, "*.tscn") var scenes

func _ready():
	var popup = get_popup()
	popup.connect("index_pressed", self, "_on_SceneMenu_index_pressed")
	for scene in scenes:
		popup.add_item(scene.get_file())
	
func _on_SceneMenu_index_pressed(index):
	get_tree().change_scene(scenes[index])


