extends Node

## entry point of ths script : 
func balise_placed():
	return 0

class ChunkGroup:
	var chunks = []

	func add_chunk(chunk):
		chunks.append(chunk)
		return 0

	func get_chunk_number():
		return chunks.size()

	func remove_chunk(chunk):
		chunks.erase(chunk)
		return 0


class ChunkManager:
	var groups = []
	
	func add_group(group):
		groups.append(group)
		return 0
	
	func remove_group(group):
		groups.erase(group)
		return 0
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
