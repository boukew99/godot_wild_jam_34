extends Area2D

export var speed := 10
var in_area = []

func _on_Highway_body_entered(body):
	in_area.append(body)

func _physics_process(delta):
	for body in in_area:
		if "velocity" in body: body.set_deferred("velocity", body.velocity + transform.x * speed)
	
func _on_Highway_body_exited(body):
	in_area.erase(body)


func on_toggle(active):
	$CollisionShape2D.disabled = active
