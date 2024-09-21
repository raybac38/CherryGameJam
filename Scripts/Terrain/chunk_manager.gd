extends Node

var TILEMAP : TileMapLayer = null
const CHUNKGROUP = preload("res://chunk_group.gd")
var groups = []

func set_tilemap(tilemap :TileMapLayer):
	TILEMAP = tilemap


# Call this function when balise is placed
func generate_new_playable_area(direction : Vector2i):
	
	###### HARDCODED AREA SHAPE
	
	var shapes = [
		[Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(-1,1)],
		[Vector2i(0,0), Vector2i(0,1), Vector2i(0,2), Vector2i(0,3)],
		[Vector2i(0,0), Vector2i(0,1), Vector2i(-1,1), Vector2i(-2,1)],
		[Vector2i(0,0), Vector2i(0,1), Vector2i(-1,1), Vector2i(-1,0)],
		[Vector2i(0,0), Vector2i(0,1), Vector2i(-1,1), Vector2i(-1,2)],
		[Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)],
		[Vector2i(0,0), Vector2i(-1,0), Vector2i(-1,1), Vector2i(-1,2), Vector2i(0,2)],
		[Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(0,2)]
		]
	
	var orientation : int = randi_range(0,2)
	var shape_number : int = randi_range(0, shapes.size()- 1)
	var shape : Array = shapes[shape_number]
	var new_shape : Array = []
	
	if(direction == Vector2i(1,0)):
		orientation += 1
	if(direction == Vector2i(0,-1)):
		orientation += 2
	if(direction == Vector2i(-1,0)):
		orientation += 3	
		
	if(orientation == 3):	#rotate -90
		for i in shape:
			var k : Vector2i = Vector2i(-i.y, i.x)
			new_shape.append(k)
	if(orientation == 0):
		for i in shape:
			var k : Vector2i = Vector2i(i.x, i.y)
			new_shape.append(k)
	if(orientation == 1):	#rotate 90
		for i in shape:
			var k : Vector2i = Vector2i(i.y, -i.x)
			new_shape.append(k)
	if(orientation == 2):
		for i in shape:
			var k : Vector2i = Vector2i(-i.x, -i.y)
			new_shape.append(k)
	
	return new_shape


func add_new_area(requested_position : Array, player_position : Vector2):
	var scale : int = Constante.NB_TUILE_PAR_CHUNK * Constante.TUILE_SIZE
	var chunk_position = Vector2i(floor(player_position.x / scale), floor(player_position.y / scale))
	
	for i in range(requested_position.size()):
		requested_position[i] += chunk_position
	
	if TILEMAP == null:
		printerr("TILEMAP IS NULL")
	var group = CHUNKGROUP.ChunkGroup.new(requested_position, TILEMAP)
	add_group(group);
	return group

func add_group(group):
	groups.append(group)
	
	return 0

func remove_group(group):
	groups.erase(group)
	return 0
