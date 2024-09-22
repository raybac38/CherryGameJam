extends Area2D

func _process(delta: float) -> void:
	var bodys = get_overlapping_bodies()
	for i in bodys:
		if i.name == "Player":
			print("TOUCHER")
	
