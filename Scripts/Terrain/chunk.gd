extends Node

const TUILE = preload("res://Scripts/Terrain/tuile.gd")

class chunk:
	var is_generated : bool = false;
	var position : Vector2i
	var tilemap_ref : TileMapLayer
	var tuiles = []
	
	func get_position():
		return position

	func _init(new_position : Vector2i, new_tilemap_ref : TileMapLayer):
		if new_tilemap_ref == null: 
			printerr("tilemap_ref is null")
			
		tilemap_ref = new_tilemap_ref
		position = new_position
		for i in range(Constante.NB_TUILE_PAR_CHUNK):
			for j in range(Constante.NB_TUILE_PAR_CHUNK):
				var tuile = TUILE.Tuile.new(Vector2i(i,j))
				add_tuile(tuile)
		blank_test()
	
	func set_tuile_id(new_id, local_position : Vector2i):
		for i : TUILE.Tuile in tuiles:
			if(i.get_posision() == local_position):
				i.set_id(new_id)
				return
	
	func add_tuile(tuile):
		tuiles.append(tuile)
	
	func remove_tuile(tuile):
		tuiles.erase(tuile)
		
	func blank_test():
		for i : TUILE.Tuile in tuiles:
			var pos = i.get_posision()
			var tuile_id = randi_range(0,6)
			i.set_id(tuile_id)
			var absolut_pos : Vector2i = pos + (position * Constante.NB_TUILE_PAR_CHUNK)
			tilemap_ref.set_cell(absolut_pos, tuile_id, Vector2i(0,0))
			tilemap_ref.update_internals()

			
