extends Node

var sfx_manager = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func play_enemy_sfx(sound: AudioStream):
	if sfx_manager.active_sfx_players.size() < sfx_manager.MAX_PLAYERS:
		var player = AudioStreamPlayer.new()
		add_child(player)
		sfx_manager.active_sfx_players.append(player)
		player.bus = "EnemySFX"
		player.stream = sound
		player.play()
	else:
		return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
