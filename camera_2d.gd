extends Camera2D
@onready var player = get_parent().get_node("Player")

@export var x_offset := -180  # 👈 hráč bude víc vlevo
@export var y_offset := 100   # jak daleko může hráč vyskočit bez pohybu kamery
@export var follow_speed := 5 # jak rychle kamera dojede

func _process(delta):
	if not player:
		return

	# vždy sleduj X
	global_position.x = player.global_position.x-x_offset

	var target_y = global_position.y

	# hráč je moc vysoko → kamera nahoru
	if player.global_position.y < global_position.y - y_offset:
		target_y = player.global_position.y + y_offset

	# hráč je moc nízko → kamera dolů
	elif player.global_position.y > global_position.y + y_offset:
		target_y = player.global_position.y - y_offset

	# plynulý pohyb
	global_position.y = lerp(global_position.y, target_y, follow_speed * delta)
