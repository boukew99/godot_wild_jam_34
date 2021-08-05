tool
extends GridContainer
# issue in editor: it uses not Project window_size (purple rect)

var screen_size = Vector2(ProjectSettings.get("display/window/size/width"), ProjectSettings.get("display/window/size/height"))
onready var rows = get_child_count() / columns

func _notification(what):
	if (what==NOTIFICATION_SORT_CHILDREN):
		rect_min_size.x = screen_size.x * columns
		rect_min_size.y = screen_size.y *  rows
		for index in get_child_count():
			var pos = Vector2(index % columns, index / columns) * screen_size
			
			fit_child_in_rect(get_child(index), Rect2(pos, screen_size))
		
#func set_some_setting():
#	# Some setting changed, ask for children re-sort
#	queue_sort()
