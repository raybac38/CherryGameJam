extends AudioStreamPlayer

#TODO faire loop la musique

func play_ambient():
	var sound = load("res://Assets/Son/Musique/ost_chill.mp3")
	if stream == sound:
		return
	if playing:
		stop()
		stream = sound
		play()
		return
	return

#TODO play_combat(phase)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
