extends Node

var active_sfx_players = []

const MAX_PLAYERS = 32

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func play_sfx(sound: AudioStream):
	if active_sfx_players.size() < MAX_PLAYERS:
		var player = AudioStreamPlayer.new()
		add_child(player)
		active_sfx_players.append(player)
		player.stream = sound
		player.play()
	else:
		return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
