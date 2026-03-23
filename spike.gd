extends Area2D


func _on_body_entered(body):
	var things = get_overlapping_bodies()
	for t in things:
		if t.has_method("Explode"):
			t.Explode()
