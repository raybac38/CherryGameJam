extends Node

class Tuile:
	var local_pos : Vector2i
	var id: int
	
	func _init(starting_position):
		set_position(starting_position)
	
	func set_position(new_position: Vector2i):
		local_pos = new_position
	
	func get_posision():
		return local_pos
	
	func set_id(new_id):
		id = new_id
		
