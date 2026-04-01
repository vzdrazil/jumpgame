extends Node2D
@onready var player = $Player

func _process(delta):
	if not player or not is_instance_valid(player):
		return
	$KillZone.position.y = player.position.y
	$KillZone.position.x += player.SPEED * delta
	
func _on_kill_zone_body_entered(body):
	if body.name == "Player":
		body.set_physics_process(false)
		call_deferred("restart_scene")

func restart_scene():
	get_tree().reload_current_scene()
	
