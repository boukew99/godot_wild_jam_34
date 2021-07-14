extends ShakeCamera2D

signal position_changed(block_postion)
var block_size = Vector2(ProjectSettings.get("display/window/size/width"), ProjectSettings.get("display/window/size/height"))
onready var target = get_parent()
onready var transition = $Transition

var current_block_position := Vector2()

func _ready():
	set_as_toplevel(true)
	
	# so immediate correct starting position
	var block_position = (target.position / block_size).floor() 
	position = block_position * block_size + block_size / 2
	yield(get_tree(), "idle_frame") 
	smoothing_enabled = true
	
func _process(delta):
	var block_position = (target.position / block_size).floor() 
	
	if block_position != current_block_position:
		current_block_position = block_position
		position = current_block_position * block_size + block_size / 2
		emit_signal("position_changed", current_block_position)




func _on_GridCamera2D_position_changed(block_postion):
	transition.play()
