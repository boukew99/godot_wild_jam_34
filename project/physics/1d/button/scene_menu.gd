extends OptionButton

export(Array, String, FILE, "*.tscn") var scenes

func _ready():
	for scene in scenes:
		add_item(scene.get_file())
	
func _on_SceneMenu_item_selected(index):
	get_tree().change_scene(scenes[index])
