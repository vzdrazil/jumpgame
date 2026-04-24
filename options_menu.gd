extends Control

@onready var music_toggle = $VBoxContainer/MusicToggle
@onready var fullscreen_toggle = $VBoxContainer/FullScreenToggle
@onready var back_button = $VBoxContainer/BackButton


func _ready():
	# Kontrola (debug – můžeš pak smazat)
	if music_toggle == null:
		print("MusicToggle NOT FOUND")
	if fullscreen_toggle == null:
		print("FullscreenToggle NOT FOUND")

	# Nastavení výchozího stavu checkboxů
	music_toggle.button_pressed = !AudioServer.is_bus_mute(0)
	fullscreen_toggle.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN

	# Připojení signálů
	music_toggle.toggled.connect(_on_music_toggled)
	fullscreen_toggle.toggled.connect(_on_fullscreen_toggled)
	back_button.pressed.connect(_on_back_button_pressed)


func _on_music_toggled(enabled):
	# Zapnutí/vypnutí zvuku
	AudioServer.set_bus_mute(0, !enabled)


func _on_fullscreen_toggled(enabled):
	if enabled:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://control.tscn")
