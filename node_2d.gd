extends Node2D
@onready var player = $Player
@onready var pause_menu = $CanvasLayer/PauseMenu
var music
var panel

@onready var portal = $EndPortal
@onready var win_panel = $WinPanel



func _on_player_won():
	get_tree().paused = true
	win_panel.visible = true


func _ready():
	portal.player_won.connect(_on_player_won)
	win_panel.visible = false
	#PauseMenu:
	
	add_child(pause_menu)
	pause_menu.visible = false
	pause_menu.hide()
	
	
	
	#Panel color:
	panel = pause_menu.get_node("Panel")
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.0, 0.012, 0.004, 0.702)
	panel.add_theme_stylebox_override("panel", style)
	
	#Music idk: 
	music = AudioStreamPlayer.new()
	add_child(music)
	music.stream = load("res://music.mp3")
	music.play()
func _process(delta):
	if not player or not is_instance_valid(player):
		return
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_pause()
	$KillZone.position.y = player.position.y
	$KillZone.position.x += player.SPEED * delta
	
func _on_kill_zone_body_entered(body):
	if body.name == "Player":
		print("COLLISION:", body)
		body.set_physics_process(false)
		call_deferred("restart_scene")

func restart_scene():
	get_tree().reload_current_scene()
func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused
	
