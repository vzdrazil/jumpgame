extends Control

func _ready():
	# Připojení signálů tlačítek
	$PlayButton.pressed.connect(_on_play_pressed)
	$OptionButton.pressed.connect(_on_options_pressed)
	$QuitButton.pressed.connect(_on_quit_pressed)

func _on_play_pressed():
	get_tree().change_scene("res://node_2d.tscn")  # Načte scénu hry

func _on_options_pressed():
	print("Otevřít nastavení")  # Tady může být popup s možnostmi

func _on_quit_pressed():
	get_tree().quit()  # Ukončí hru
