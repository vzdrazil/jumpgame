extends Camera2D
@onready var player = get_parent().get_node("Player")


@export var y_offset := 100   # jak daleko může hráč vyskočit bez pohybu kamery
@export var follow_speed := 5 # jak rychle kamera dojede

func _process(delta):
	if not player:
		return

	# vždy sleduj X (Geometry Dash styl)
	global_position.x = player.global_position.x

	# sleduj Y jen pokud je hráč moc vysoko
	var target_y = global_position.y
	
	if player.global_position.y < global_position.y - y_offset:
		target_y = player.global_position.y + y_offset

	# plynulý pohyb (aby to necukalo)
	global_position.y = lerp(global_position.y, target_y, follow_speed * delta)
