extends Camera2D

signal position_changed(block_postion)
var block_size = Vector2(ProjectSettings.get("display/window/size/width"), ProjectSettings.get("display/window/size/height"))
onready var target = get_parent()


func _ready():
	set_as_toplevel(true)
	offset = block_size / 2
	
	# so immediate correct starting position
	smoothing_enabled = false
	var block_position = (target.position / block_size).floor() 
	position = block_position * block_size
	yield(get_tree(), "idle_frame")
	smoothing_enabled = true
	

	
func _process(delta):
	var block_position = (target.position / block_size).floor() 
	position = block_position * block_size
	emit_signal("position_changed", block_position)


