extends CheckButton 


func _ready():
	pass


func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(3)
	else:
		DisplayServer.window_set_mode(0)
