extends Node

@onready var TILEMAP : TileMapLayer = $TileMapLayer

const CHUNKGROUP = preload("res://chunk_group.gd")


## entry point of ths script : 
func balise_placed():
	return 0

var chunk_manager : ChunkManager

func _ready() -> void:
	print("start")
	
	chunk_manager = ChunkManager.new(TILEMAP)
	var test_group : Array = [Vector2i(0,0)]
	
	chunk_manager.add_new_area(test_group)
	
class ChunkManager:
	var groups = []
	var tilemap : TileMapLayer = null
	
	func _init(new_tilemap : TileMapLayer):
		tilemap = new_tilemap
	
	##Return a group for later use
	func add_new_area(requested_position : Array):
		print("new area")
		print(requested_position)
		var group = CHUNKGROUP.ChunkGroup.new(requested_position, tilemap)
		add_group(group);
		return group
	
	
	func add_group(group):
		groups.append(group)
		
		return 0
	
	func remove_group(group):
		groups.erase(group)
		return 0
	
