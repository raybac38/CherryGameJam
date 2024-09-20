extends Node

const CHUNK = preload("res://chunk.gd")

class ChunkGroup:
	var chunks = []
	
	var tilemap : TileMapLayer = null;
	
	
	## give a liste of vector2i for all new chunk that need to be show
	func _init(requested_position : Array, new_tilemap : TileMapLayer):
		tilemap = new_tilemap
		for i in requested_position:
			var chunk = CHUNK.chunk.new(i, new_tilemap)
			print("add a chunk at")
			print(i)
			add_chunk(chunk);

	func add_chunk(chunk):
		chunks.append(chunk)
		return 0

	func get_chunk_number():
		return chunks.size()

	func remove_chunk(chunk):
		chunks.erase(chunk)
		return 0
