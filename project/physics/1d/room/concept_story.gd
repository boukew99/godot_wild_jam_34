extends Control

onready var tab = $HBoxContainer/TabContainer
onready var click = $Click

func _ready():
	$HBoxContainer/Next.grab_focus()
	
func _on_Previous_pressed():
	tab.current_tab -= 1
	click.play()


func _on_Next_pressed():
	click.play()
	if tab.current_tab == tab.get_child_count() -1:
		$Transition.change_scene()
	else:
		tab.current_tab += 1
