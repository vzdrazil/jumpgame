extends Node2D

func physics_process(delta):
	$KillZone.position.y=$Player.position.y
	$KillZone.position.x += $Player.SPEED*delta
	


func _on_kill_zone_body_entered(body):
	var things = $KillZone.get_overlapping_bodies()
