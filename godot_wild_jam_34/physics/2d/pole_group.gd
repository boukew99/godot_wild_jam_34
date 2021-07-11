extends Node2D

signal completed

onready var chime = $AudioStreamPlayer

var active_childeren := 0

func _ready():
	for child in get_children():
		if child.has_signal("toggled"): child.connect("toggled", self, "toggled")
		if child.has_node("Timer"): child.get_node("Timer").wait_time = get_child_count()
		
func toggled(active : bool):
	active_childeren += 1 if active else -1
	if active:
		chime.pitch_scale = pow(2, (active_childeren) / 12.0) # Set note
		chime.play()
	
	print(active_childeren)
	if active_childeren == get_child_count():
		emit_signal("completed")
