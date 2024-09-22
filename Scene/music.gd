extends AudioStreamPlayer

#TODO comprendre pourquoi les attributs du stream sont grisés

func play_ambient():
	var sound = load("res://Assets/Son/Musique/ost_chill.ogg")
	if stream == sound:
		return
	if playing:
		stop()
		stream = sound
		play()
		stream.loop = true
		stream.loop_offset = 33.88
		return
	return

func play_combat(phase: int):
	var sound
	if phase == 1:
		sound = load("res://Assets/Son/Musique/ost_fight1.ogg")
	elif phase == 2:
		sound = load("res://Assets/Son/Musique/ost_fight2.ogg")
	elif phase == 3:
		sound = load("res://Assets/Son/Musique/ost_fight3.ogg")
	elif phase == 4:
		sound = load("res://Assets/Son/Musique/ost_fight4.ogg")
	else:
		return
		
	if stream == sound:
		return
	if playing:
		stop()
		stream = sound
		play()
		stream.loop = true
		stream.loop_offset = 16.94
		return
	return

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
