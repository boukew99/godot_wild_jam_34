extends Label

signal story_end

const LINES = [
	"Long ago were the days when the human kind walked the earth.",
	"Now scattered all over the universe in the aftermath" \
		+ " of the Great Space War, \nthe survivors scavenge" \
		+ " the broken ships that litter the vast battlefield.",
	"However, the hidden traps and the maze-like corridors of the wreckage \n" \
	+ "make the search for relics a perilous adventure in its own right.",
	"You are one of the many scavengers, searching for anything \n" \
	+ "to remember the once-peaceful Planet Earth by."
]

var state = "init"
var current_line = 0
onready var anim = $AnimationPlayer

func call_ready():
	percent_visible = 0
	$Timer.start()

func next_step():
	match state:
		"init":
			pass
		"empty":
			text = LINES[current_line]
			current_line += 1
			anim.play("Write")
			state = "writing"
		"writing":
			anim.stop()
			percent_visible = 1
			state = "idle"
		"idle":
			anim.play("Clear")
			if current_line == LINES.size():
				print("closing")
				state = "closing"
				$Timer.wait_time = 2
				$Timer.start()
			else:
				state = "clearing"
		"clearing":
			pass

func _on_Timer_timeout():
	if state == "init":
		state = "empty"
	elif state == "clearing":
		state = "empty"
	elif state == "closing":
		emit_signal("story_end")
	next_step()


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"Write":
			state = "idle"
		"Clear":
			$Timer.wait_time = 0.4
			$Timer.start()


func _on_Button_pressed():
	next_step()
