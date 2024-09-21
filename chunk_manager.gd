extends Node

@onready var TILEMAP : TileMapLayer = $TileMapLayer

const CHUNKGROUP = preload("res://chunk_group.gd")

const MAXGROUPSHOWED = 2


## entry point of ths script : 
func balise_placed():
	##need to get a random area
	return 0

var chunk_manager : ChunkManager

func _ready() -> void:
	print("start")
	
	chunk_manager = ChunkManager.new(TILEMAP)
	var test_group : Array = [Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(2,1)]
	
	chunk_manager.add_new_area(test_group)
	
class ChunkManager:
	var groups = []
	var tilemap : TileMapLayer = null
	
	func _init(new_tilemap : TileMapLayer):
		tilemap = new_tilemap
	
	
	# Call this function when balise is placed
	func generate_new_playable_area(directon : Vector2i, position :Vector2i):
		
		###### HARDCODED AREA SHAPE
		
		var shapes = [
			
		]
		
		
		return
	
	
	func add_new_area(requested_position : Array):
		var group = CHUNKGROUP.ChunkGroup.new(requested_position, tilemap)
		add_group(group);
		return group
	
	func add_group(group):
		groups.append(group)
		
		return 0
	
	func remove_group(group):
		groups.erase(group)
		return 0
	
