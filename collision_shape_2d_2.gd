extends CollisionShape2D


func _on_tree_entered() -> void:
	var things = get_overlapping_bodies()
	for t in things:
		if t.has_method("Explode"):
			t.Explode()# Replace with function body.
