extends Node

const CHUNK = preload("res://Scripts/Terrain/chunk.gd")

class ChunkGroup:
	var chunks = []
	var line : Line2D = null
	
	var tilemap : TileMapLayer = null;
	
	
	## give a liste of vector2i for all new chunk that need to be show
	func _init(requested_position : Array, new_tilemap : TileMapLayer):
		tilemap = new_tilemap
		for i in requested_position:
			var chunk = CHUNK.Chunk.new(i, new_tilemap)
			add_chunk(chunk);
	
	func get_chunk(index : int):
		return chunks[index]

	func add_chunk(chunk):
		chunks.append(chunk)
		return 0
	
	func get_chunks():
		return chunks

	func get_chunk_number():
		return chunks.size()

	func decrement_all_chunk_references():
		for index in range(chunks.size()):
			var chunk : CHUNK.Chunk = chunks[index]
			print("Decrementing to all of the group")
			chunk.decrement_references()
		return 0
		
	func generate_terrain():
		for i : CHUNK.Chunk in chunks:
			i.blank_test()
			
	func set_chunk(index : int, chunk):
		chunks[index] = chunk
		
