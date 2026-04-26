extends CanvasLayer

@onready var back_button = $Panel/VBoxContainer/Button

func _ready():
	back_button.pressed.connect(_on_back_pressed)

func _on_back_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://control.tscn")
