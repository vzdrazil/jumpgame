extends Control

func _ready():
	# Připojení signálů tlačítek
	$PlayButton.pressed.connect(_on_play_pressed)
	$OptionButton.pressed.connect(_on_options_pressed)
	$QuitButton.pressed.connect(_on_quit_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")  # Načte scénu hry

func _on_options_pressed():
	get_tree().change_scene_to_file("res://options_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()  # Ukončí hru
