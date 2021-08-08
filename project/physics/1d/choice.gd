extends VBoxContainer

export var response = "heyyy"
export var text = ""

func _ready():
	$Button.text = name + str(get_position_in_parent())

func _on_Button_pressed():
	$Label.text = response
	for child in get_children():
		child.show()
