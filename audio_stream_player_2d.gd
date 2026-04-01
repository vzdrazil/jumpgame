extends AudioStreamPlayer2D


@onready var music = $Music

func _ready():
	music.play()
