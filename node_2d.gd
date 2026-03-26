extends Node2D
@onready var player = $Player

func _physics_process(delta):
	$KillZone.position.y = player.position.y
	$KillZone.position.x += player.SPEED * delta


func _on_kill_zone_body_entered(body):
	if body.is_in_group("enemy"):
		body.Explode()
			
 
