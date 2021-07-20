extends AudioStreamPlayer

export(Array, AudioStreamOGGVorbis) var streams_sequence
export var section := 0

func _on_LoopBackPlayer_finished():
	stream = streams_sequence[section]
	play()

func next():
	section = clamp(section + 1, 0, streams_sequence.size())
