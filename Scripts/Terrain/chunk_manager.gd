extends Node

var TILEMAP : TileMapLayer = null
const CHUNKGROUP = preload("res://Scripts/Terrain/chunk_group.gd")
const CHUNK = preload("res://Scripts/Terrain/chunk.gd")
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
	
	
	##On a la liste des positions des chunk requested
	## Ajouter une vérification pour que si deux chunk se chevauche, alors 
	
	## Qu'est ce que j'ai a disposition ?
	## le group qui est crée
	## groups ou y'a les autres groupes
	
	## Dans le groupe que j'ai crée, est ce que j'ai un chunk qui existe dans les deux autres groupes ?
	## si oui, enlevé le chunk du groupe et le remplacer par une référence a l'autre
	
	for i in range(group.get_chunk_number()):
		var chunk : CHUNK.Chunk = group.get_chunk(i)

		for index_old_group in range(groups.size()):
			var old_group = groups[index_old_group]
			
			for k in range(old_group.get_chunk_number()):
				var old_chunk : CHUNK.Chunk = old_group.get_chunk(k)
				
				if chunk.is_position_equal(old_chunk):
					chunk.decrement_references()
					old_chunk.increment_references()
					group.set_chunk(i, old_chunk)
					print("find a copy")
	
	add_group(group);
	group.generate_terrain()
	return group

func add_group(group):
	groups.append(group)
	if(groups.size() > Constante.MAX_GROUP_SHOWED):
		remove_group(0)
		print("too much groupe, removing")
	return 0

func remove_group(group_index : int):
	var group : CHUNKGROUP.ChunkGroup = groups[group_index]
	group.decrement_all_chunk_references()
	groups.remove_at(0)
	return 0
