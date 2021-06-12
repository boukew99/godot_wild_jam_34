extends Camera2D

signal position_changed(block_postion)
var block_size = Vector2(ProjectSettings.get("display/window/size/width"), ProjectSettings.get("display/window/size/height"))
onready var target = get_parent()

func _ready():
	set_as_toplevel(true)
	offset = block_size / 2
	
func _process(delta):
	var block_position = (target.position / block_size).floor() 
	position = block_position * block_size
	emit_signal("position_changed", block_position)
